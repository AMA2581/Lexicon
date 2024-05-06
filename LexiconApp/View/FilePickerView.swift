//
//  FilePickerView.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import AppKit
import SwiftUI

struct FilePickerView: View {
    @StateObject private var viewModel = FilePickerViewModel()

    var body: some View {
        Button("Pick File") {
            viewModel.pickDocument(isSW: false)
        }
        if !viewModel.isFileNil() {
//            Text("Selected file: \(url.lastPathComponent)")
            Button("Pick Stop Word File") {
                viewModel.pickDocument(isSW: true)
            }
            
            if !viewModel.isSWNil() {
                Button("Start Tokenizing") {
                    viewModel.model.start()
                }
            }
        }
    }
}

#Preview {
    FilePickerView()
}
