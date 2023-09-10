//
//  ListCell.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import SwiftUI

struct ListCell: View {
    var title: String
    var caption: String
    
    var body: some View {
        HStack {
            Rectangle()  // Using Rectangle as a placeholder
                .frame(width: 130, height: 130)
                .foregroundColor(Color.gray)
                .padding(.trailing)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.bottom)
                Text(caption)
            }
        }
        .frame(height: 200)
        .cornerRadius(5)
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(title: "Manly' men won't buy electric cars because they think it will dent",
                 
                 caption: "Electric vehicles (EVs) are often deemed the future of transport, with titans like Ford and Tesla racing to make them. But a new study reveals that 'more macho' men may not see this the same way, in the bizarre belief that EVs will harm their image.")
    }
}
