//
//  ViewController.swift
//  Project05_GCD_2
//
//  Created by milo on 16/9/13.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///给线程添加屏障
//        dependThread()
        
        ///回到主线程
//        mainQueue()
        
        ///异步 全局队列
        asyncGlobalQueue()
        
    }
    
    //当A和B两个并行任务 都完成以后 ，再做c
    func dependThread(){
        let queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT)
        async(queue, threadName: "dispatch-1 ")
        async(queue, threadName: "dispatch-2 ")
        
        //我希望上方2个执行完毕以后 再执行下方代码
        //barrier 屏障，障碍物
        dispatch_barrier_async(queue) { 
            self.printThreadName(queue, name: "dispatch_barrier ")
        }
        
        async(queue, threadName: "dispatch-3 ")
        async(queue, threadName: "dispatch-4 ")
    }
    
    func async(queue: dispatch_queue_t, threadName: String){
        dispatch_async(queue) { 
            self.printThreadName(queue, name: threadName)
        }
    }
    
    func printThreadName(queue: dispatch_queue_t, name: String){
        sleep(2)
        print(name + String(NSThread.currentThread()))
    }
    
    //使用主队列 异步
    //优先级 主队列 必须在主线程中运行：作用回到主线程
    func mainQueue(){
        let mainQueue = dispatch_get_main_queue()
        printAsync(mainQueue)
    }
    
    //在全局队列上运行任务，全局队列是 并行队列
    /*异步 全局队列*/
    func asyncGlobalQueue(){
        let queue = dispatch_get_global_queue(0, 0)
        
        printAsync(queue)
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
    
    func cycle(x: String){
        for i in 0..<10 {
            print(x + String(i) + String(NSThread.currentThread()))
        }
    }
}

