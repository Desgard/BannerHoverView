//
//  SampleView.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SnapKit
import Toaster

class SampleView: BannerHoverView {
    var bakView: UIView!
    var titleLabel: UILabel!
    var bannerImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialViews()
        addSubviews()
        setLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initialViews() {
        self.backgroundColor = UIColor.init(red: 139 / 255.0, green: 195 / 255.0, blue: 74 / 255.0, alpha: 1)
        
        bakView = UIView.init()
        bakView.backgroundColor = UIColor.init(red: 76 / 255.0, green: 175 / 255.0, blue: 80 / 255.0, alpha: 1)
        
        titleLabel = UILabel()
        titleLabel.text = "BannerHoverView Sample"
        titleLabel.textColor = .white
        
        bannerImageView = UIImageView()
        bannerImageView.contentMode = .scaleAspectFit
        bannerImageView.image = UIImage(named: "banner")
        
        self.setScrollAction { (view, offset) in
            self.bakView.alpha = offset
            self.titleLabel.alpha = 1 - offset
            self.bannerImageView.alpha = offset
        }
        
        self.setTopAction { (view) in
            let toast = Toast(text: "On the Top!", duration: Delay.short)
            toast.show()
            
        }
        
        self.setBottomAction { (view) in
            let toast = Toast(text: "On the Bottom!", duration: Delay.short)
            toast.show()
        }
    }
    
    fileprivate func addSubviews() {
        addSubview(bakView)
        addSubview(titleLabel)
        addSubview(bannerImageView)
    }
    
    fileprivate func setLayouts() {
        bakView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        bannerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
            make.top.equalTo(self.snp.top).offset(20)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
