//
//  PostCell.swift
//  MyEndz
//
//  Created by Dinesh Vijaykumar on 30/10/2016.
//  Copyright © 2016 Dinesh Vijaykumar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImage:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }
    
    
    func configureCell(post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.postDescription
    }

}
