//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/14.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String //공유 해야 되기 때문에 published
    let insertDate: Date
        
    init(content: String, insertDate: Date = Date()) {
        id = UUID()
        
        self.content = content
        self.insertDate = insertDate
    }
}

