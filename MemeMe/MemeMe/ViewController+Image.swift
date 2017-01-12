//
//  ViewController+Image.swift
//  MemeMe
//
//  Created by Sant, Eddy on 2017-01-10.
//  Copyright © 2017 Eddy Sant. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            shareButton.isEnabled = true
            imageViewPicker.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func pickAnImageFromAlbum() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
func generateMemedImage() -> UIImage {
        
        hideToolBars(true)
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        hideToolBars(false)
        
        return memedImage
    }
    
}

