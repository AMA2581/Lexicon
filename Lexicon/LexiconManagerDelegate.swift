//
//  ModelDelegate.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/27/24.
//

import Foundation

protocol LexiconManagerDelegate {
    func didStartTraining(_ manager: LexiconManager, model: LexiconModel)
    func didUpdate(_ manager: LexiconManager, model: LexiconModel)
    func didFinishTraining(_ manager: LexiconManager, model: LexiconModel)
    func didFail(error: Error)
}
