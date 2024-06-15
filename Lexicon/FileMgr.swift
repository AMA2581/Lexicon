// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi, Mohammad Jamshidi
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

struct FileMgr {
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

        // reading
        do {
            out = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            fatalError("\(error)")
        }

        return out
    }

    func writeTrainedTxtFile(dictionary: [String: [Double]]) {
        let fileManager = FileManager.default
        var writeStr = ""
        for dic in dictionary {
            writeStr += ".T\n"
            writeStr += "\(dic.key)\n"
            writeStr += ".D\n"
            var counter = 1
            for doc in dic.value {
                writeStr += "\(counter) = \(doc)\n"
                counter += 1
            }
        }

        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("trainedData.ama25")
            try writeStr.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            fatalError("\(error)")
        }
    }
}
