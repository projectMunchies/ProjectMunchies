//
//  LiveReviewAddReviewView.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 1/17/24.
//

import Foundation
import SwiftUI

struct FocusTextField: UIViewRepresentable {
    @Binding var isFirstResponder: Bool
    @Binding var text: String

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var isFirstResponder: Bool
        @Binding var text: String

        init(isFirstResponder: Binding<Bool>, text: Binding<String>) {
            _isFirstResponder = isFirstResponder
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        // Corrected placement of the textFieldTapped function
        @objc func textFieldTapped() {
            print("Text field tapped!")
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isFirstResponder: $isFirstResponder, text: $text)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textFieldTapped), for: .editingDidBegin)

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text

        if isFirstResponder {
            uiView.becomeFirstResponder()
            DispatchQueue.main.async {
                // Set isFirstResponder back to false after becoming first responder
                self.isFirstResponder = false
            }
        } else {
            uiView.resignFirstResponder()
        }
    }

    // Additional method to handle tap gesture
    func onTapGesture(perform action: @escaping () -> Void) -> some View {
        return self
    }
}
