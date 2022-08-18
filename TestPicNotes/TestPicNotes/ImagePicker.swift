//
//  ImagePicker.swift
//  TestPicNotes
//
//  Created by Jose Pearldrought on 5/1/22.

import Foundation
import SwiftUI



struct imagePicker:UIViewControllerRepresentable {
    @Binding var showPicturePicker: Bool
    @Binding var image: UIImage?
    
    typealias Coordinator = imagePickerCoordinator
    typealias UIViewControllerType = UIImagePickerController
    
    var sourceType:UIImagePickerController.SourceType = .camera
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePickerCoordinator(image: $image, showPicturePicker: $showPicturePicker)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController{
        let pick = UIImagePickerController()
        
        pick.sourceType = sourceType
        pick.delegate = context.coordinator
        return pick
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
}

class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showPicturePicker: Bool
        
    
    init(image:Binding<UIImage?>, showPicturePicker: Binding<Bool>) {
            _image = image
            _showPicturePicker = showPicturePicker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiimage
            showPicturePicker = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showPicturePicker = false
    }


}
