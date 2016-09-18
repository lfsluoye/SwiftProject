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

}

