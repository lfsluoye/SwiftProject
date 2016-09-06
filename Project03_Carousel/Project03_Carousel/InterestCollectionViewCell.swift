//
//  InterestCollectionViewCell.swift
//  Project03_Carousel
//
//  Created by milo on 16/8/29.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    private func updateUI() {
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
