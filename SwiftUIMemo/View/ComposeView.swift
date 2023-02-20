//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/15.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    @State private var content: String = "" //현재 메모장 들어가서만 변경 가능
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $content) //이렇게 하면 content 속성과 TextEditor가 바인딩 됨.
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
                    .padding()
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모") // 처음 +버튼을 눌렀을 땐 memo = nil이기 때문에 새 메모, detailview에서 편집 버튼을 눌렀을 땐 저장되어 있는 content가 있기 때문에 memo != nil 따라서 메모 편집
            .navigationBarTitleDisplayMode(.inline )
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading){ //navigationBarLeading: 왼쪽에 생성
                    Button{
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing){ //navigationBarTrailing: 오른쪽에 생성
                    Button{
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.inset(memo: content)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                    } 
                     
                    
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
    }
}
