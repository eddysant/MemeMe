//
//  MemeEditorViewController
//  MemeMe
//
//  Created by Sant, Eddy on 2017-01-09.
//  Copyright © 2017 Eddy Sant. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UINavigationControllerDelegate  {

    @IBOutlet weak var imageViewPicker: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var topToolBar: UIToolbar!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initTextField(topText)
        initTextField(bottomText)
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func initTextField(_ textField: UITextField) {
        let memeTextAttributes:[String:Any] = [
            NSStrokeColorAttributeName: UIColor.black,
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName: -3.0]
        
        textField.defaultTextAttributes = memeTextAttributes
        textField.autocapitalizationType = .allCharacters
        textField.textAlignment = .center
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func resetState() {
        self.topText.delegate = self
        self.bottomText.delegate = self
        imageViewPicker.image = nil
        shareButton.isEnabled = false
        topText.text = "TOP"
        bottomText.text = "BOTTOM"
    }
    
    @IBAction func shareMeme() {

        let image = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        controller.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.saveMeme(image)
            }
        }

        self.present(controller, animated: true, completion:nil)
    }
    
    func saveMeme(_ memedImage : UIImage) {
        // Create the meme
        let meme = Meme(topText: topText.text!, bottomText: bottomText.text!, originalImage: imageViewPicker.image!, memedImage: memedImage)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.savedMemes.append(meme)
    }
    
    func hideToolBars(_ show:Bool){
        topToolBar.isHidden = show
        bottomToolBar.isHidden = show
    }

}

