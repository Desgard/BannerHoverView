//
//  ShowTableViewCell.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 5
    }
    
    public func configureCell(text: String, image: String) {
        txt.text = text
        img.image = UIImage(named: image)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
