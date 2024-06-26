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
import PythonKit

class Stemmer {
    
    func stemmer(_ input: String) -> String {
        let out = String(runPython(input)) ?? "something's wrong"
        return out
    }
    
    private func runPython(_ input: String) -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/ama25/Documents/Side_Projects/Lexicon/Lexicon/Stemmer/")
        let file = Python.import("PyStemmer")
        
        let response = file.stemmer(input)
        return response
    }
}
