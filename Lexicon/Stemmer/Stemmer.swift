//
//  StemPyReader.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/28/24.
//

import Foundation
import PythonKit

class Stemmer {
    
    // TODO: change this to gets token and update it
    func stemmer(_ input: String) -> String {
        let out = String(runPython(input)) ?? "something's wrong"
        return out
    }
    
    private func runPython(_ input: String) -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/ama25/Documents/Lexicon/Lexicon/Stemmer/")
        let file = Python.import("PyStemmer")
        
        let response = file.stemmer(input)
//        print(response)
        return response
    }
}
