//
//  StemPyReader.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/28/24.
//

import Foundation
import PythonKit

class StemPyReader {
    func runPython() -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/ama25/Documents/Lexicon/Lexicon/Stemmer/")
        let file = Python.import("PyStemmer")
        
        let response = file.stemmer()
//        print(response)
        return response
    }
}
