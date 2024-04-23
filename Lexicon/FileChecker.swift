//
//  FileChecker.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

struct FileChecker {
    
    func fileUrlGetter(datasetFolderUrl DFURL: URL?) -> [URL] {
        let datasetFolderURL = DFURL
        var output: [URL] = []
//        print(datasetFolderURL)
        do {
            if let datasetFolderURL {
                let itemsInDirectory = try FileManager.default.contentsOfDirectory(at: datasetFolderURL, includingPropertiesForKeys: nil)
                for item in itemsInDirectory {
//                    let fileName: NSString = NSString(string: item.absoluteString)
                    output.append(item)
//                    print(fileName)
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
}
