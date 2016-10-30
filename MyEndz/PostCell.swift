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
        // Initialization code
    }
    
    
    func configureCell(post: Post) {
        titleLabel.text = post.title
        descLabel.text = post.postDescription
    }

}
