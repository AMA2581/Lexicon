//
//  FileChecker.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

struct FileChecker {
    init() {
        let datasetFolderURL = Bundle.main.resourceURL
//        print(datasetFolderURL)
        do {
            if let datasetFolderURL {
                let itemsInDirectory = try FileManager.default.contentsOfDirectory(at: datasetFolderURL, includingPropertiesForKeys: nil)
                for item in itemsInDirectory {
                    let fileName: NSString = NSString(string: item.absoluteString)
//                    print(fileName)
                }
            }
        } catch {
            fatalError("\(error)")
        }
    }
}
