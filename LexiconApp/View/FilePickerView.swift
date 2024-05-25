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

import AppKit
import SwiftUI

struct FilePickerView: View {
    @StateObject private var viewModel = FilePickerViewModel()

    var body: some View {
        if viewModel.isRunning {
            Text("Running...")
        } else if !viewModel.isRunning && !viewModel.isDoneRunning() {
            VStack {
                Button("Pick File") {
                    viewModel.pickDocument(isSW: false)
                }
                if !viewModel.isFileNil() {
                    //            Text("Selected file: \(url.lastPathComponent)")
                    Button("Pick Stop Word File") {
                        viewModel.pickDocument(isSW: true)
                    }
                    
                    if !viewModel.isSWNil() {
                        Button("Start") {
                            viewModel.start()
                        }
                    }
                }
            }
        } else {
            ScrollView {
                HStack {
                    Text("done")              
                }
            }
        }
    }
}

#Preview {
    FilePickerView()
}
