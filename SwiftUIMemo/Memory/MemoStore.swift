//
//  MemoStor.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/14.
//

import Foundation
import SwiftUI

class MemoStore: ObservableObject {
    @Published var list : [Memo] //공유 해야 되기 때문에 published
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date()),
            Memo(content: "dfjnkf", insertDate: Date(timeIntervalSinceNow: 3600 * -24)),
            Memo(content: "dd", insertDate: Date(timeIntervalSinceNow: 3600 * -48))
        ]
    }
                 
    func inset(memo: String){
        list.insert(Memo(content: memo), at:0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo
        else {
            return }
         memo.content = content
    }
    
    func delete(memo: Memo){
        list.removeAll{ $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
