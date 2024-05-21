//
//  MainView.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import AppKit
import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            // TODO: add swiftUI for tf and idf and ifidf
            FilePickerView()
        }
        .padding(.all, 25)
    }
}

#Preview {
    MainView()
}
