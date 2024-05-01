//
//  DocumentPickerViewController.swift
//  LexiconApp
//
//  Created by Amir Mahdi Abravesh on 5/1/24.
//

import Foundation
import AppKit

//class DocumentPickerViewController: UIDocumentPickerViewController {
//    private let onDismiss: () -> Void
//    private let onPick: (URL) -> ()
//
//    init(supportedTypes: [String], onPick: @escaping (URL) -> Void, onDismiss: @escaping () -> Void) {
//        self.onDismiss = onDismiss
//        self.onPick = onPick
//
//        super.init(documentTypes: supportedTypes, in: .open)
//
//        allowsMultipleSelection = false
//        delegate = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension DocumentPickerViewController: UIDocumentPickerDelegate {
//    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//        onPick(urls.first!)
//    }
//
//    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
//        onDismiss()
//    }
//}
