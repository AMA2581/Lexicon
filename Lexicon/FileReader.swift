//
//  FileChecker.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

struct FileReader {
    
    func fileUrlGetter(datasetFolderUrl DFURL: URL?) -> [URL] {
        let datasetFolderURL = DFURL
        var output: [URL] = []
        
        do {
            if let datasetFolderURL {
                let itemsInDirectory = try FileManager.default.contentsOfDirectory(at: datasetFolderURL, includingPropertiesForKeys: nil)
                for item in itemsInDirectory {
                    output.append(item)
                }
            }
        } catch {
            fatalError("\(error)")
        }
        
        return output
    }

    func fileNameGetter(datasetFolderPath DFStr: String) {
        do {
            let itemsInDirectory = try FileManager.default.contentsOfDirectory(atPath: DFStr)
            for item in itemsInDirectory {
                let fileName: NSString = NSString(string: item)
                print(fileName)
            }
        } catch {
            fatalError("\(error)")
        }
    }
    
    func readFile(fileURL: URL) -> String {
        var out: String
        
        //reading
        do {
            out = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            fatalError("\(error)")
        }
        
        return out
    }
}
