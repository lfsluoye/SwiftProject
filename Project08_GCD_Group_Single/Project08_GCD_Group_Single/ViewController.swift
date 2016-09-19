//
//  ViewController.swift
//  Project08_GCD_Group_Single
//
//  Created by lifushuai on 16/9/19.
//  Copyright © 2016年 lifushuai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func beginGroup(){
        let queue = DispatchQueue.global()
        let groupQueue = DispatchGroup()
        
    }

    // MARK: 懒加载
    lazy var downBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: 50, width: 60, height: 30)
        btn.backgroundColor = UIColor.purple
        btn.setTitle("开始下载", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal);
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(beginGroup), for: .touchUpInside)
        return btn
    }()

}

