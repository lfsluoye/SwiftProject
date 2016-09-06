//
//  ViewController.swift
//  Project01_SimpleTimer
//
//  Created by milo on 16/8/28.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    ///显示定时时间
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    private var counter = 0.0 {
        didSet{
            timeLabel.text = String(format: "%.1f", counter)
        }
    }
   private var timer = NSTimer()
   private var isPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseBtn.enabled = false
    }
    
    

    @IBAction func beginButton(sender: UIButton) {
        beginBtn.enabled = false
        pauseBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @IBAction func pauseButton(sender: UIButton) {
        beginBtn.enabled = true
        pauseBtn.enabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetButton(sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        beginBtn.enabled = true
        pauseBtn.enabled = false
    }
    func updateTimer() {
        counter = counter + 0.1
        
    }
}

