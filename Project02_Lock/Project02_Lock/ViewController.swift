//
//  ViewController.swift
//  LFLock
//
//  Created by milo on 16/9/3.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //创建一个车票池
    lazy var ticketList: Array<Int> = {
        var ticketArray = Array<Int>()
        for i in 0..<20 {
            ticketArray.append(i)
        }
        return ticketArray
    }()
    
    let lock: NSLock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clickSale(sender: UIButton) {
        let t1 = NSThread(target: self, selector: #selector(sale), object: nil)
        t1.name = "1号"
        
        let t2 = NSThread(target: self, selector: #selector(sale), object: nil)
        t2.name = "2号"
        
        t1.start()
        t2.start()
    }
    func sale(){
        print("%@", NSThread.currentThread())
        
        while true {
            //锁住下方操作
            self.lock.lock()
            
            if self.ticketList.count > 0 {
                sleep(1)
                
                //每次卖出最后一张
                self.ticketList.removeLast()
                
                print("%@卖出了第%lu张票", NSThread.currentThread().name,self.ticketList.count)
            }else{
                NSThread.exit()
            }
            self.lock.unlock()
        }
    }
}

