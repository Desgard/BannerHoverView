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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialViews()
        addSubviews()
        setLayouts()
        
        self.addSubview(bakView);
        
        self.setScrollAction { (view, offset) in
            self.bakView.alpha = offset
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initialViews() {
        self.backgroundColor = UIColor.gray
        
        bakView = UIView.init()
        bakView.backgroundColor = .lightGray
        
        titleLabel = UILabel()
        titleLabel.text = "BannerHoverView Sample"
        titleLabel.textColor = .white
    }
    
    fileprivate func addSubviews() {
        addSubview(bakView)
        addSubview(titleLabel)
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
    }
}
