//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/14.
//
 
import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.list) { memo in //삭제를 하려면 foreach 구문이 필요함.
                    NavigationLink{
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete) //foreach 구문에서 삭제해줘야 함.
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
                //sheet는 바인딩 한 속성에 true가 저장되면 클로저({}안에 구현된 것)를 실행, 클로저에서 리턴한 뷰를 모델 방식으로 출력해줌.
                .sheet(isPresented: $showComposer){ // button을 클릭하면 'showComposer = true' 살행 됨. 따라서 바인딩 된 showComposer가 true가 되어 클로저 실행.
                    ComposeView()
                }
                
            }
        }
        
    }
     
    struct MainListView_Previews: PreviewProvider {
        static var previews: some View {
            MainListView()
               .environmentObject(MemoStore()) // listview 보이게 하려면 따로 꼭 등록해야함!
        } 
    }
}


