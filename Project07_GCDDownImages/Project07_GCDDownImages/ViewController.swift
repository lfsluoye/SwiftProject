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
        self.downBtn.isHidden = false
        
    }
    // MARK: private Method
    func downLoadImage(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        var imageList = Array<UIImage>()
        
        let queue = DispatchQueue(label: "AsyncConcurrent", attributes:DispatchQueue.Attributes.concurrent)
        for url in self.imageURLs {
            queue.async {
                let data = NSData.init(contentsOf: url)
                let img = UIImage.init(data: data as! Data)
                imageList.append(img!)
            }
        }
        
        queue.async(flags: .barrier){//添加隔断
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                var i = 0
                for image in imageList {
                    let iv = self.imageViewList[i]
                    iv.image = image
                    i += 1
                }
            }
        }
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
        var i = 0
        var lastView = UIView()
        for _ in self.imageURLs {
            
            let iv = UIImageView()
            iv.contentMode = UIViewContentMode.scaleAspectFit
            self.view.addSubview(iv)
            iv.snp.makeConstraints({ (make) in
                if (i == 0){
                    make.top.equalTo(self.downBtn.snp.bottom).offset(20)
                    make.left.equalTo(20)
                    make.right.equalTo(-20)
                }else{
                    make.top.equalTo(lastView.snp.bottom).offset(20)
                    make.size.equalTo(lastView)
                    if (i == self.imageURLs.count - 1){
                        make.bottom.equalTo(-20)
                    }
                }
            })
            lastView = iv
            arr.append(iv)
            
            i += 1
        }
        
        return arr
    }()
    /// 下载按钮
    lazy var downBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("开始下载", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal);
        btn.setTitle("高亮状态", for: .highlighted)
        btn.setTitleColor(UIColor.blue, for: .highlighted)
        btn.backgroundColor = UIColor.purple
        btn.addTarget(self, action: #selector(downLoadImage), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        })
        return btn
    }()

}

