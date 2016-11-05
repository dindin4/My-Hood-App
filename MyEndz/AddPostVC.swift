//
//  AddPostVC.swift
//  MyEndz
//
//  Created by Dinesh Vijaykumar on 30/10/2016.
//  Copyright © 2016 Dinesh Vijaykumar. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var postImage: UIImageView!
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    @IBAction func addPic(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePost(_ sender: Any) {
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(image: img)
            
            let post = Post(imagePath: imagePath, title: title, description: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            postImage.image = pickedImage
        }
    }
}
