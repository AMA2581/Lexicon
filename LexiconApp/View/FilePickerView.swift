//
//  FilePickerView.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import SwiftUI
import AppKit

struct FilePickerView: View {
  @State private var selectedFileURL: URL?

  func pickDocument() {
    let panel = NSOpenPanel()
    panel.allowsMultipleSelection = false
    panel.allowedFileTypes = ["txt", "", "all"] // Adjust for your file types

      panel.beginSheetModal(for: .init()) { responce in
          //
      }
      if panel.isVisible {
      selectedFileURL = panel.url
    }
  }

  var body: some View {
    Button("Pick File") {
      pickDocument()
    }
    if let url = selectedFileURL {
      Text("Selected file: \(url.lastPathComponent)")
    }
  }
}

#Preview {
    FilePickerView()
}
