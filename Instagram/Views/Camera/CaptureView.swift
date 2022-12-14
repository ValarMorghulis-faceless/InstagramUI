//
//  CaptureView.swift
//  Instagram
//
//  Created by Giorgi Samkharadze on 13.11.22.
//

import Foundation
import SwiftUI

struct CaptureView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
      @Binding var isShown: Bool
      @Binding var image: Image?
      @Binding var isUsingCamera: Bool

    init(isShown: Binding<Bool>, image: Binding<Image?>, isUsingCamera: Binding<Bool>) {
        _isShown = isShown
        _image = image
        _isUsingCamera = isUsingCamera
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = isUsingCamera ? .camera : .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // do nothing
    }
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isShown: Bool
    @Binding var image: Image?

  init(isShown: Binding<Bool>, image: Binding<Image?>) {
      _isShown = isShown
      _image = image
  }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // user canceled
        isShown = false
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        image = Image(uiImage: uiimage)
        isShown = false
    }
}
