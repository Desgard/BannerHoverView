//
//  BaiduWMViewController.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class EleViewController: UIViewController {
    
    var backButton: UIButton = {
        var button = UIButton.init(type: .custom)
        button.setTitle("◀", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = BackButtonColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()

    var tableView: UITableView!
    var bannerHoverView: EleHoverView!
    
    deinit {
        tableView.removeObserver(bannerHoverView, forKeyPath: "contentOffset")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
    }
    
    fileprivate func initialViews() {
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        bannerHoverView = EleHoverView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 125))
        bannerHoverView.hoverTop = 65
        bannerHoverView.headerScrollView = tableView
        
        tableView.addObserver(bannerHoverView, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        
        view.addSubview(tableView)
        view.addSubview(bannerHoverView)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.bottom.equalTo(self.view.snp.bottom).offset(-50)
        }
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EleViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension EleViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
