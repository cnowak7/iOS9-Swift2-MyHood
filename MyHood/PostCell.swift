//
//  PostCell.swift
//  MyHood
//
//  Created by Chris Nowak on 6/2/16.
//  Copyright © 2016 Chris Nowak Tho, LLC. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    // IBOutlets
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        postImageView.layer.cornerRadius = self.postImageView.frame.size.width / 2
        postImageView.clipsToBounds = true
    }
    
    // Custom Helper Methods
    
    func configureCell(post: Post) {
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
        postImageView.image = DataService.sharedInstance.imageForPath(post.imagePath)
    }

}
