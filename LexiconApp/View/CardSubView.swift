//
//  CardSubView.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 6/9/24.
//

import SwiftUI

struct CardSubView: View {
    @State private var isHovering = false
    @State private var isPresenting = false
    @State var title: String?
    @State var author: String?
    @State var index: String
    @State var text: String?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if title != nil {
                    Text(title!)
                        .font(.system(size: 25, weight: .bold))
                        .lineLimit(3)
                }
                HStack {
                    if author != nil {
                        Text(author!)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color(.gray))
                        Text("-")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color(.gray))
                    }
                    Text(index)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(Color(.gray))
                }
                Spacer()
                    .frame(height: 16)
                if text != nil {
                    Text(text!)
                        .font(.system(size: 18, weight: .regular))
                }
            }
            .padding(15)
            Spacer()
        }
        .frame(minWidth: 300)
        .frame(minHeight: 100)
        .background(isHovering
            ? Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.80)
            : Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 0.40)
        )
        .shadow(color: .black.opacity(0.2), radius: 16, x: 8, y: 8)
        .cornerRadius(20)
        //            .foregroundColor(isHovering ? .red : .blue)
        .onHover { hovered in
            isHovering = hovered
        }
    }
}

#Preview {
    CardSubView(title: "Title",
                author: "Author",
                index: "Index",
                text: "Text")
}
