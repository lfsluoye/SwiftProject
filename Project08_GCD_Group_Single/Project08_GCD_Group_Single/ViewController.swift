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
        self.downBtn.isHidden = false
    }
    
    func beginGroup(){
        //新建队列分组
//        let groupQueue = DispatchGroup()
//        
//        //把任务分组异步执行
//        DispatchQueue.global().async(group: groupQueue, execute: {
//            sleep(2)
//            print("A任务执行完毕" +  String(describing: Thread.current))
//        })
//        
//        DispatchQueue.global().async(group: groupQueue, execute: {
//            sleep(2)
//            print("B任务执行完毕" +  String(describing: Thread.current))
//        })
        
        
        
    }

    // MARK: 懒加载
    /// 下载按钮
    lazy var downBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("开始下载", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal);
        btn.setTitle("高亮状态", for: .highlighted)
        btn.setTitleColor(UIColor.blue, for: .highlighted)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(beginGroup), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        })
        return btn
    }()

}

