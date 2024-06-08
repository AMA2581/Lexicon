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

class LexiconModelView: ObservableObject {
    @Published private(set) var selectedFileURL: URL?
    @Published private(set) var isLoading = false
    var manager = LexiconManager()

    func pickDocument() {
        isLoading = true
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        // only file that is acceptible is a .ama25 file that has to be created using Lexicon binary
        // or being provided by valuable source
        panel.allowedFileTypes = ["ama25"] // Adjust for file types

        panel.beginSheetModal(for: .init()) { _ in
//            print(panel.url)
            self.selectedFileURL = panel.url
            DispatchQueue.global().async {
                self.manager.setFile(fileURL: self.selectedFileURL!)
                self.isLoading = false
            }
        }
    }
    
    func search(input: String) {
        
    }
}
