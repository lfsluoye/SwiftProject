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
        let queue = dispatch_queue_create("AsyncSerial", DISPATCH_QUEUE_SERIAL)
        printAsync(queue)
    }
    
    //异步（线程） 并行（任务）
    func asyncConcurrent(){
        //先创建队列，再把任务加到队列里并选择区线程执行
        let queue = dispatch_queue_create("AsyncConcurrent", DISPATCH_QUEUE_CONCURRENT)
        
        printAsync(queue)
    }
    //同步（主线程） 串行（任务）
    func syncSerial(){
        let queue = dispatch_queue_create("SyncSerial", DISPATCH_QUEUE_SERIAL)
        
        printAync(queue)
    }
    //同步（主线程） 并行（任务）
    func syncConcurrent(){
        let queue = dispatch_queue_create("SyncConcurrent", DISPATCH_QUEUE_CONCURRENT)
        printAync(queue)
    }
    //打印异步数据
    func printAsync(queue: dispatch_queue_t){
        dispatch_async(queue) {
            self.cycle("i")
        }
        
        dispatch_async(queue) {
            self.cycle("j")
        }
    }
    
    //打印同步数据
    func printAync(queue: dispatch_queue_t){
        dispatch_sync(queue) {
            self.cycle("i")
        }
        
        dispatch_sync(queue) {
            self.cycle("j")
        }
    }
    
    func cycle(x: String){
        for i in 0..<10 {
            print(x + String(i) + String(NSThread.currentThread()))
        }
    }

}

