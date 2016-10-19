//
//  ViewController.swift
//  Project07_GCDDownImages
//
//  Created by milo on 16/9/18.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    // MARK: private Method
    func downLoadImage(){
        
    }
    
    // MARK: 懒加载
    lazy var imageURLs:Array<URL> = {
        var arr = [URL]()
        let address1 = "http://b.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f7c133711f700e0cf3d7cad65b.jpg"
        let address2 = "http://h.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c812f9fe0e1be3eb13533fa400b.jpg"
        let address3 = "http://d.hiphotos.baidu.com/image/pic/item/1c950a7b02087bf479bbcce0f0d3572c11dfcf60.jpg"
        arr = [URL.init(string: address1)!,
               URL.init(string: address2)!,
               URL.init(string: address3)!]
        
        return arr
    }()
    lazy var imageViewList:Array<UIImageView> = {
        var arr = [UIImageView]()
        
        for i in self.imageURLs {
            let iv = UIImageView()
            iv.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(iv)
            iv.snp.makeConstraints({ (make) in
                
            })
        }
        
        return arr
    }()
    /// 下载按钮
    lazy var downBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 20, y: 50, width: 60, height: 30)
        btn.setTitle("开始下载", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal);
        btn.setTitle("高亮状态", for: .highlighted)
        btn.setTitleColor(UIColor.blue, for: .highlighted)
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(downLoadImage), for: .touchUpInside)
        return btn
    }()

}

