//
//  FilePickerViewController.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import Foundation
import AppKit

class FilePickerViewModel: ObservableObject {
    @Published private(set) var selectedFileURL: URL?
    
    func pickDocument() {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["txt", "", "all"] // Adjust for your file types

        panel.beginSheetModal(for: .init()) { responce in
//            print(panel.url)
            self.selectedFileURL = panel.url
        }
    }
}
