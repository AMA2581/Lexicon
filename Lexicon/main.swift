//
//  main.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/22/24.
//

import Foundation

var fileReader = FileReader()

let files = fileReader.fileUrlGetter(datasetFolderUrl: URL(string: "/Users/ama25/Documents/Lexicon/Lexicon/cacm/"))

let content = fileReader.readFile(fileURL: files[1])

print(content)

