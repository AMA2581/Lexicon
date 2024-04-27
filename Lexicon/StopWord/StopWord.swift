//
//  StopWord.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/27/24.
//

import Foundation
import PythonKit

class StopWord {
    func runPython() -> PythonObject {
        let sys = Python.import("sys")
        sys.path.append("/Users/ama25/Documents/Lexicon/Lexicon/StopWord/")
        let file = Python.import("PyStopWord")
        
        let response = file.hello_world()
        print(response)
        return response
    }
}
