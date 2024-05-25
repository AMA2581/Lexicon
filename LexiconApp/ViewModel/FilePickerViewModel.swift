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
    @Published private(set) var tf: [String: [Double]]?
    @Published private(set) var idf: [String: Double]?
    @Published private(set) var tfIdf: [String: [Double]]?
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

    func isDoneRunning() -> Bool {
        if tf != nil && idf != nil && tfIdf != nil {
            return true
        } else {
            return false
        }
    }

    func start() {
//        let concurrentQueue = DispatchQueue(label: "backend", attributes: .concurrent)
//        concurrentQueue.sync {
        model.start()
        // TODO: fix the isRunning being stuck issue
        isRunning = model.isRunning
        tf = model.tf
        idf = model.idf
        tfIdf = model.tfIdf
//        }
    }

    func toStrTF() -> String {
        var out = ""

        if tf != nil {
            for item in tf! {
                out += "\(item.key): "
                for value in item.value {
                    out += "\(value), "
                }
                out += "\n"
            }
        }

        return out
    }

    func toStrIDF() -> String {
        var out = ""

        if idf != nil {
            for item in idf! {
                out += "\(item.key): \(item.value)\n"
            }
        }

        return out
    }

    func toStrTFIDF() -> String {
        var out = ""

        if tfIdf != nil {
            for item in tfIdf! {
                out += "\(item.key): "
                for value in item.value {
                    out += "\(value), "
                }
                out += "\n"
            }
        }

        return out
    }

//    func resultToStr() -> String {
//        var out = ""
//
//        for result in model.tf {
//            out += "\(result.key): "
//           for value in result.value {
//                out += "\(value), "
//            }
//            out += "\n"
//        }
//
//        return out
//    }
}
