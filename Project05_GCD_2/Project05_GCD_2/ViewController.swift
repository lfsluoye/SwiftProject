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
        let queue = DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent)
        async(queue, threadName: "dispatch-1 ")
        async(queue, threadName: "dispatch-2 ")
        
        //我希望上方2个执行完毕以后 再执行下方代码
        //barrier 屏障，障碍物
        queue.async(flags: .barrier, execute: { 
            self.printThreadName(queue, name: "dispatch_barrier ")
        }) 
        
        async(queue, threadName: "dispatch-3 ")
        async(queue, threadName: "dispatch-4 ")
    }
    
    func async(_ queue: DispatchQueue, threadName: String){
        queue.async { 
            self.printThreadName(queue, name: threadName)
        }
    }
    
    func printThreadName(_ queue: DispatchQueue, name: String){
        sleep(2)
        print(name + String(describing: Thread.current))
    }
    
    //使用主队列 异步
    //优先级 主队列 必须在主线程中运行：作用回到主线程
    func mainQueue(){
        let mainQueue = DispatchQueue.main
        printAsync(mainQueue)
    }
    
    //在全局队列上运行任务，全局队列是 并行队列
    /*异步 全局队列*/
    func asyncGlobalQueue(){
        let queue = DispatchQueue.global(priority: 0)
        
        printAsync(queue)
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
    
    func cycle(_ x: String){
        for i in 0..<10 {
            print(x + String(i) + String(describing: Thread.current))
        }
    }
}

