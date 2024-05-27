//
//  ModelDelegate.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/27/24.
//

import Foundation

protocol ModelDelegate {
    func didStartTraining(_ model: Model)
    func didFinishTraining(_ model: Model)
    func didFail(error: Error)
}
