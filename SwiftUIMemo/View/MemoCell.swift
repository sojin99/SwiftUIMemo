//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/15.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test")) //Memo class의 content 프로퍼티에 임이의 값 저장 (오류 나지 않게)
    }
}
