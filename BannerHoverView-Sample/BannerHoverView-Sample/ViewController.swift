//
//  ViewController.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var bannerHoverView: SampleView!
    
    deinit {
        tableView.removeObserver(bannerHoverView, forKeyPath: "contentOffset")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
    }
    
    fileprivate func initialViews() {
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        bannerHoverView = SampleView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 280))
        bannerHoverView.top = 65
        bannerHoverView.headerScrollView = tableView
        
        tableView.addObserver(bannerHoverView, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        
        view.addSubview(tableView)
        view.addSubview(bannerHoverView)
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

