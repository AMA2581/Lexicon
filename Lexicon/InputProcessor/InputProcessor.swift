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

class InputProcessor {
    let cmath = CMath()

    func indexer(mainTF: [String: [Double]],
                 inputTF: [String: [Double]]) -> [String: [Double]] {
        var output: [String: [Double]] = [:]
        var sameWords: [String: [Double]] = [:]

        for tf in mainTF {
            for input in inputTF {
                if tf.key == input.key {
                    sameWords[tf.key] = tf.value
                }
            }
        }

        for sameWord in sameWords {
            for input in inputTF {
                if sameWord.key == input.key {
                    output[sameWord.key] = cmath.dotProduct(mainVector: sameWord.value,
                                                            inputVector: input.value)
                }
            }
        }

        return output
    }

    func indexer(mainIDF: [String: Double],
                 inputIDF: [String: Double]) -> [String: Double] {
        var output: [String: Double] = [:]
        var sameWords: [String: Double] = [:]

        for tf in mainIDF {
            for input in inputIDF {
                if tf.key == input.key {
                    sameWords[tf.key] = tf.value
                }
            }
        }

        for sameWord in sameWords {
            for input in inputIDF {
                if sameWord.key == input.key {
                    output[sameWord.key] = cmath.dotProduct(mainVector: sameWord.value,
                                                            inputVector: input.value)
                }
            }
        }

        
        return output
    }

    func indexer(mainTFIDF: [String: [Double]],
                 inputTFIDF: [String: [Double]]) -> [String: [Double]] {
        var output: [String: [Double]] = [:]
        var sameWords: [String: [Double]] = [:]

        for tf in mainTFIDF {
            for input in inputTFIDF {
                if tf.key == input.key {
                    sameWords[tf.key] = tf.value
                }
            }
        }

        for sameWord in sameWords {
            for input in inputTFIDF {
                if sameWord.key == input.key {
                    output[sameWord.key] = cmath.dotProduct(mainVector: sameWord.value,
                                                            inputVector: input.value)
                }
            }
        }


        return output
    }
}
