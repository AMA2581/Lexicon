// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi, Mohammad Jamshidi
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

import Foundation

class LexiconManager: ObservableObject {
    var model = LexiconModel()
    var results: [DocItem] = []
    var cardItems: [CardItem] = []

    var delegate: LexiconManagerDelegate?

    func setFile(fileURL: URL) {
        model.setFile(fileURL: fileURL)
        model.getTrainedData()
    }

    func setFile(fileString: String) {
        model.setFile(fileString: fileString)
    }

    func isFileUrlNil() -> Bool {
        return model.isFileUrlNil()
    }
    
    func search(input: String) {
        results = model.search(input: input)
    }
    
    func fetchResultDocuments() {
        cardItems = model.fetchResultDocuments(docItem: results)
    }
}
