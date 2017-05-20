//
//  BaiduWMHoverView.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit
import SnapKit

let EleBlue: UIColor = UIColor.init(red: 29 / 255.0, green: 157 / 255.0, blue: 1, alpha: 1)

class EleHoverView: BannerHoverView {
    
    
    
    var searchView: UIButton = {
        let view = UIButton(type: .custom)
        view.backgroundColor = .white
        view.setTitle("输入商家、商品名称", for: .normal)
        view.titleLabel?.font = UIFont.init(name: "PingFangSC-Regular", size: 12)
        view.setTitleColor(.gray, for: .normal)
        return view
    }()
    
    var positionLabel: UILabel = {
        var label = UILabel()
        label.text = "成都"
        label.font = UIFont.init(name: "PingFangSC-Bold", size: 18)
        label.textColor = .white
        return label
    }()
    
    var pinButton: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.setImage(UIImage(named: "pin"), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = EleBlue
        initialViews()
        addViews()
        setLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initialViews() {
        searchView.layer.masksToBounds = true
        searchView.layer.cornerRadius = 15
    
    }
    
    fileprivate func addViews() {
        self.addSubview(searchView)
        self.addSubview(pinButton)
        self.addSubview(positionLabel)
    }
    
    fileprivate func setLayouts() {
        searchView.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        
        pinButton.snp.makeConstraints { (make) in
            make.left.equalTo(searchView.snp.left)
            make.bottom.equalTo(searchView.snp.top).offset(-25)
            make.height.equalTo(20)
            make.width.equalTo(18)
        }
        
        positionLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(pinButton)
            make.left.equalTo(pinButton.snp.right).offset(5)
        }
    }
}
