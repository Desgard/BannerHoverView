//
//  ViewController.swift
//  BannerHoverView-Sample
//
//  Created by 段昊宇 on 2017/5/20.
//  Copyright © 2017年 Desgard_Duan. All rights reserved.
//

import UIKit

let BackButtonColor = UIColor.init(red: 244 / 255.0, green: 67 / 255.0, blue: 54 / 255.0, alpha: 1)

class ViewController: UIViewController {
    
    let cellDatas: [[String]] = [
        ["Ele", "饿了么首页",],
        
    ]
    
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
        automaticallyAdjustsScrollViewInsets = false
        
        navigationController?.navigationBar.isHidden = true
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        
        bannerHoverView = SampleView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: 280))
        bannerHoverView.hoverTop = 65
        bannerHoverView.headerScrollView = tableView
        
        tableView.addObserver(bannerHoverView, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        
        tableView.register(UINib.init(nibName: "ShowTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowTableViewCell")
        
        view.addSubview(tableView)
        view.addSubview(bannerHoverView)
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDatas.count
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShowTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ShowTableViewCell", for: indexPath) as! ShowTableViewCell
        cell.configureCell(text: cellDatas[indexPath.row][1], image: cellDatas[indexPath.row][0])
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(EleViewController(), animated: true)
        }
    }
}

