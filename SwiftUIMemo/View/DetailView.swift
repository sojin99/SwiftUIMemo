//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/15.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    @State private var showDelete = false
    
    var body: some View {
        VStack {
            ScrollView{
                VStack{
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                 
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{ // 메모 편집
            ToolbarItemGroup(placement: .bottomBar){
                //삭제
                Button {
                    showDelete = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                //true가 저장되면 경고창이 뜨고, false가 저장되면 경고창이 사라짐.
                .alert("삭제 확인", isPresented: $showDelete) {                     //.destructive로 하면 적절한 위치에 지정이 되고, 자동으로 빨간색으로 지정
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                    } label: {
                        Text("삭제")
                    }
                } message: {
                   Text("삭제 하지마~!")
                }
                //편집
                Button{
                    showComposer = true
                } label:{
                    Image(systemName: "square.and.pencil") }
            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
} 

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(memo: Memo(content: "Hello")) //Memo class 생성자의 content에 오류가 나지 않게 더미메모 저장
                .environmentObject(MemoStore())
        }
       
    }
}
