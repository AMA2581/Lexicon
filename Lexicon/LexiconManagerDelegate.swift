//
//  ModelDelegate.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/27/24.
//

import Foundation

protocol LexiconManagerDelegate {
    func didStartTraining(_ model: LexiconModel)
    func didFinishTraining(_ model: LexiconModel)
    func didFail(error: Error)
}
