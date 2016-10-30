//
//  AddPostVC.swift
//  MyEndz
//
//  Created by Dinesh Vijaykumar on 30/10/2016.
//  Copyright © 2016 Dinesh Vijaykumar. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var postImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }

    @IBAction func addPic(_ sender: UIButton) {
        sender.setTitle("", for: .normal)
    }
    
    @IBAction func makePost(_ sender: Any) {
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
