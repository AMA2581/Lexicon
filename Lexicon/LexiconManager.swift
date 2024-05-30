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

class LexiconManager {
    var model = LexiconModel()

    var delegate: LexiconManagerDelegate?

    func setFile(fileURL: URL) {
        model.setFile(fileURL: fileURL)
    }

    func setFile(fileString: String) {
        model.setFile(fileString: fileString)
    }

    func setStopWordFile(fileURL: URL) {
        model.setStopWordFile(fileURL: fileURL)
    }

    func setStopWordFile(fileString: String) {
        model.setStopWordFile(fileString: fileString)
    }

    func isFileNil() -> Bool {
        return model.isFileNil()
    }

    func isSWNil() -> Bool {
        return model.isSWNil()
    }

    // TODO: add proper start function and also give access to this object to change variables in Model.
    // TODO: add delegate
    // TODO: add proper logging system

    func startTraining() {
        delegate?.didStartTraining(self, model: model)

        model.fetchContent()
        // making sure it went without errors
        if model.content != nil {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("Couldn't fetch content"))
        }

        model.fetchSW()
        if model.stopWord != nil {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("Couldn't fetch stopword"))
        }

        // DO NOT MAKE THIS CONCURRENT
        // IT WILL RUIN THE PYTHONKIT AND IT
        // WON'T WORK

        model.fetchTokens()
        if !model.tokens.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't tokenize"))
        }
        if !model.seperatedDoc.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't seperate documents"))
        }

        model.fetchDictionary()
        if !model.dictionary.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't make frequency dictionary"))
        }

        model.fetchTF()
        if !model.tf.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't make TF"))
        }

        model.fetchIDF()
        if !model.idf.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't make IDF"))
        }

        model.fetchTFIDF()
        if !model.tfIdf.isEmpty {
            delegate?.didUpdate(self, model: model)
        } else {
            delegate?.didFail(error: fatalError("couldn't make TFIDF"))
        }

        delegate?.didFinishTraining(self, model: model)
    }
}
