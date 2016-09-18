//
//  ViewController.swift
//  Project06_GCDImageDown
//
//  Created by milo on 16/9/16.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 从ios9开始，苹果默认不支持http开头的网络地址，只支持https（安全连接）开头
/*
 App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
 App Transport Security 被中断了，因为一个http：//被发送，你要解决它需要通过在你的app的info.plist文件中进行配置
 解决方案：到info.plist中，最后一行 添加App Transport Security
 */
    let imgPath = "http://h.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c812f9fe0e1be3eb13533fa400b.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: 创建UI界面
    func createUI(){
        self.view.addSubview(downBtn)
        
    }
    
    // MARK: 方法
    func downLoadImage(){
         DispatchQueue.global().async(execute: { 
            //    从网络上下载下来的的数据或者本地上传的数据--这个数据流肯定是二进制
            //    NSData 这个是 二进制类型
            //    URLWithString 可以自动把http/https开头的字符串地址，转化为URL
            let imgURL = URL.init(string: self.imgPath)
            
            //    dataWithContentsOfURL 到URL锁指定的地址中，把资源下载下来，这个过程是同步的
            
            
            print("\(imgURL)")
            let dataImg = try! Data.init(contentsOf: imgURL!)
            
//                二进制数据转为 UIImage类型数据
            let img = UIImage.init(data: dataImg)
//                    会被用户感知的操作，放到主线程运行
            DispatchQueue.main.async(execute: {
                self.downIV.image = img
            })
         })
    }
    
    // MARK: 懒加载
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
    
    lazy var downIV: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 200, height: 400))
        imageView.backgroundColor = UIColor.red
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        //下载完图片才生成容器,有效节省内存
        self.view.addSubview(imageView)
        return imageView
    }()
    
}

