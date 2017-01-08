//
//  ViewController.swift
//  Project10_Animation
//
//  Created by milo on 16/12/18.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var penguinView: UIImageView!
    var frames: NSArray?
    var dieCenter: CGPoint?
    var dwonBack : Bool = true
    var upBack : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = UIImage(named: "penguin_walk01")!
        let image2 = UIImage(named: "penguin_walk02")!
        let image3 = UIImage(named: "penguin_walk03")!
        let image4 = UIImage(named: "penguin_walk04")!
        
        let frames: [UIImage] = [image1, image2, image3, image4]
        penguinView.animationDuration = 0.15;
        penguinView.animationRepeatCount = 2;
        penguinView.animationImages = frames
        
        ///walk right 
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.walkRight(_:)))
        swipeGestureRight.direction = .right
        view.addGestureRecognizer(swipeGestureRight)
        
        //walk left
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.walkLeft(_:)))
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeGestureLeft)
        
        //jump
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.jump(_:)))
        view.addGestureRecognizer(tap)
        
        //longPress
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        view.addGestureRecognizer(longPress)

        
        
    }
    func walkLeft(_ send: UIGestureRecognizer) {
        print("walk left")
        if self.penguinView.center.x < 0.0 {
            self.penguinView.center = CGPoint(x: view.frame.size.width, y: self.penguinView.center.y)
        }
        
        self.penguinView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.penguinView.startAnimating()
        
        UIView.animate(withDuration: 0.6) { 
            self.penguinView.center = CGPoint(x: self.penguinView.center.x - 30, y: self.penguinView.center.y)
        }
        
    }
    func walkRight(_ send: UIGestureRecognizer) {
        print("walk right")
        if self.penguinView.center.x > self.view.frame.size.width {
            self.penguinView.center = CGPoint(x: 0, y: self.penguinView.center.y)
        }
        
        self.penguinView.transform = CGAffineTransform.identity
        self.penguinView.startAnimating()
        UIView.animate(withDuration: 0.6) { 
            self.penguinView.center = CGPoint(x: self.penguinView.center.x + 30, y: self.penguinView.center.y)
        }
    }
    
    func jump(_ send: UIGestureRecognizer){
        if !self.upBack || !self.dwonBack{
            return
        }
        self.upBack = false
        penguinView.startAnimating()
        UIView.animate(withDuration: 0.25, animations: {
            self.penguinView.center = CGPoint(x: self.penguinView.center.x, y: self.penguinView.center.y - 50)
        }, completion: { (finished: Bool) in
            self.jumpBack()
            self.upBack = true
        })
    }
    func jumpBack(){
        UIView.animate(withDuration: 0.25) { 
            self.penguinView.center = CGPoint(x: self.penguinView.center.x, y: self.penguinView.center.y + 50)
        }
    }
    func longPress(_ send: UIGestureRecognizer) {
        if !self.dwonBack || !self.upBack {
            return
        }
        self.dwonBack = false
        UIView.animate(withDuration: 0.33, animations: { () -> Void in
            self.dieCenter = self.penguinView.center
            self.penguinView.center = CGPoint(x: self.penguinView.center.x, y: self.view.frame.size.height)
        }, completion: { (finished: Bool) -> Void in
            self.longPressBack()
            self.dwonBack = true
        })
    }
    
    func longPressBack() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.penguinView.center = self.dieCenter!
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

