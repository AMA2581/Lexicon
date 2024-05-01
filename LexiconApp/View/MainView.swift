//
//  MainView.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import SwiftUI
import AppKit

struct MainView: View {
    var body: some View {
        NavigationStack {
            Button {
//                let picker = DocumentPickerViewController(
//                    supportedTypes: ["log"],
//                    onPick: { url in
//                        print("url : \(url)")
//                    },
//                    onDismiss: {
//                        print("dismiss")
//                    }
//                )
//                NSApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
            } label: {
                Text("Choose file")
            }
        }
        .padding(.all, 25)
    }
}

#Preview {
    MainView()
}
