// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program;

import AppKit
import Foundation

class FilePickerViewModel: ObservableObject {
    @Published private(set) var selectedFileURL: URL?
    @Published private(set) var results: [String: Int]?
    @Published private(set) var isRunning = false
    var model = Model()
    
    func pickDocument(isSW: Bool) {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.allowedFileTypes = ["txt", "", "all"] // Adjust for file types

        panel.beginSheetModal(for: .init()) { _ in
//            print(panel.url)
            self.selectedFileURL = panel.url
            if isSW {
                self.saveSWUrl()
            } else {
                self.saveFileUrl()
            }
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
    
    func start() {
        isRunning = true
        let concurrentQueue = DispatchQueue(label: "backend", attributes: .concurrent)
        concurrentQueue.sync {
            results = model.start()
            isRunning = false
        }
    }
    
    func resultToStr() -> String {
        var out = ""
        
        for result in results! {
            out += "\(result.key): \(result.value)\n"
        }
        
        return out
    }
}
