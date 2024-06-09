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

struct MainView: View {
    @StateObject private var viewModel = LexiconModelView()
    @State private var input = ""

    var body: some View {
        NavigationStack {
            if viewModel.manager.isFileUrlNil() {
                Button("pick trained file") {
                    viewModel.pickDocument()
                }
            } else if viewModel.isLoading {
                VStack(spacing: 15.0) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Text("Loading trained data...")
                }
            } else if !viewModel.isLoading
                && !viewModel.isDoneSearching
                && !viewModel.isSearching {
                VStack(spacing: 10.0) {
                    TextField("Search", text: $input)
                    Button {
                        viewModel.search(input: input)
                    } label: {
                        HStack(spacing: 10.0) {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }
                }
            } else if !viewModel.isLoading
                && !viewModel.isDoneSearching
                && viewModel.isSearching {
                VStack(spacing: 15.0) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Text("Searching...")
                }
            } else if !viewModel.isLoading
                && viewModel.isDoneSearching
                && !viewModel.isSearching {
                ScrollView {
                    ForEach(0 ..< viewModel.fetchCards().count, id: \.self) { index in
                        CardSubView(title: viewModel.fetchCards()[index].title,
                                    author: viewModel.fetchCards()[index].author,
                                    index: viewModel.fetchCards()[index].index,
                                    text: viewModel.fetchCards()[index].text)
                    }
                }
            }
        }
        .padding(.all, 25)
    }
}

#Preview {
    MainView()
}
