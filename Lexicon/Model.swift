//
//  File.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import Foundation

class Model {
    private var fileReader = FileReader()
    private var tokenizer = Tokenizer()
    
    private var fileURL: URL?
    private var stopWordURL: URL?
    
    func setFile(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    func setFile(fileString: String) {
        self.fileURL = URL(string: fileString)
    }
    
    func setStopWordFile(fileURL: URL) {
        self.stopWordURL = fileURL
    }
    
    func setStopWordFile(fileString: String) {
        self.stopWordURL = URL(string: fileString)
    }
    
    func isFileNil() -> Bool {
        if fileURL == nil {
            return true
        } else {
            return false
        }
    }
    
    func isSWNil() -> Bool {
        if stopWordURL == nil {
            return true
        } else {
            return false
        }
    }
    
    func start() -> [Token] {
        var content: String?
        var stopWord: String?
        var tokens: [Token] = []
        
        if let URL = fileURL {
            content = fileReader.readFile(fileURL: URL)
        }
        
        if let URL = stopWordURL {
            stopWord = fileReader.readFile(fileURL: URL)
            tokenizer.setStopWord(string: stopWord!)
        }
        
        if let safeContent = content {
            tokens = tokenizer.tokenizer(data: safeContent)
        }
        
        return tokens
    }
}
