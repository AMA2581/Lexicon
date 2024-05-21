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

var fileReader = FileReader()
var tokenizer = Tokenizer()

let files = fileReader.fileUrlGetter(datasetFolderUrl: URL(string: "/Users/ama25/Documents/Lexicon/Lexicon/cacm/"))
let content = fileReader.readFile(fileURL: files[1])

let stopWord = fileReader.readFile(fileURL: files[2])
tokenizer.setStopWord(string: stopWord)

var tokens = tokenizer.tokenizer(data: content)
var stemmer = Stemmer()


//for token in tokens {
//    print(token.getToken())
//    print(token.type)
//    print("-------------------------------")
//}

var makeDic = MakeDictionary(tokens: tokens)
var dictionary = makeDic.freqDictionary()

for dic in dictionary {
    print(dic)
}
