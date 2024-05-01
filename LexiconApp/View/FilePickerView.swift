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
            viewModel.pickDocument()
        }
        if let url = viewModel.selectedFileURL {
            Text("Selected file: \(url.lastPathComponent)")
        }
    }
}

#Preview {
    FilePickerView()
}
