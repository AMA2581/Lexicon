//
//  FilePickerViewController.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import AppKit
import Foundation

class FilePickerViewModel: ObservableObject {
    @Published private(set) var selectedFileURL: URL?
    var model = Model()
    
    func pickDocument() {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["txt", "", "all"] // Adjust for file types

        panel.beginSheetModal(for: .init()) { _ in
//            print(panel.url)
            self.selectedFileURL = panel.url
        }
    }
    
    func saveFileUrl() {
        if let safeURL = selectedFileURL {
            print(safeURL)
            model.setFile(fileURL: safeURL)
        }
    }
    
    func saveSWUrl() {
        if let safeURL = selectedFileURL {
            print(safeURL)
            model.setStopWordFile(fileURL: safeURL)
        }
    }
    
    func isSWNil() -> Bool {
        return model.isSWNil()
    }
    
    func isFileNil() -> Bool {
        return model.isFileNil()
    }
}
