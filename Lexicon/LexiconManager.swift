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

import Foundation

class LexiconManager {
    var model = LexiconModel()
    
    func setFile(fileURL: URL) {
        model.setFile(fileURL: fileURL)
    }
    
    func setFile(fileString: String) {
        model.setFile(fileString: fileString)
    }
    
    func setStopWordFile(fileURL: URL) {
        model.setStopWordFile(fileURL: fileURL)
    }
    
    func setStopWordFile(fileString: String) {
        model.setStopWordFile(fileString: fileString)
    }
    
    func isFileNil() -> Bool {
        return model.isFileNil()
    }
    
    func isSWNil() -> Bool {
        return model.isSWNil()
    }
    
    // TODO: add proper start function and also give access to this object to change variables in Model.
    // TODO: add delegate
    // TODO: add proper logging system
    
}
