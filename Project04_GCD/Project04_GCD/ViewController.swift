//
//  ViewController.swift
//  Project04_GCD
//
//  Created by milo on 16/9/13.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        asyncSerial()
//        asyncConcurrent()
//        syncSerial()
        syncConcurrent()
    }
    //异步（线程） 串行（任务）
    func asyncSerial(){
        //先创建任务对列 -》对垒放到线程中执行
        //参数1：队列的名称 是const char *类型 用“”
        //参数2：代表队列的类型 是串行 还是并行
        let queue = DispatchQueue(label: "AsyncSerial", attributes: [])
        printAsync(queue)
    }
    
    //异步（线程） 并行（任务）
    func asyncConcurrent(){
        //先创建队列，再把任务加到队列里并选择区线程执行
        let queue = DispatchQueue(label: "AsyncConcurrent", attributes: DispatchQueue.Attributes.concurrent)
        
        printAsync(queue)
    }
    //同步（主线程） 串行（任务）
    func syncSerial(){
        let queue = DispatchQueue(label: "SyncSerial", attributes: [])
        
        printAync(queue)
    }
    //同步（主线程） 并行（任务）
    func syncConcurrent(){
        let queue = DispatchQueue(label: "SyncConcurrent", attributes: DispatchQueue.Attributes.concurrent)
        printAync(queue)
    }
    //打印异步数据
    func printAsync(_ queue: DispatchQueue){
        queue.async {
            self.cycle("i")
        }
        
        queue.async {
            self.cycle("j")
        }
    }
    
    //打印同步数据
    func printAync(_ queue: DispatchQueue){
        queue.sync {
            self.cycle("i")
        }
        
        queue.sync {
            self.cycle("j")
        }
    }
    
    func cycle(_ x: String){
        for i in 0..<10 {
            print(x + String(i) + String(describing: Thread.current))
        }
    }

}

