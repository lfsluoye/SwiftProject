//
//  ViewController.swift
//  Project11_AnimationWithQuartzCore
//
//  Created by milo on 16/12/18.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    @IBOutlet weak var gravity: UIButton!

    @IBOutlet weak var push: UIButton!
    
    @IBOutlet weak var attachment: UIButton!
    var collision: UICollisionBehavior!
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    override func viewDidAppear(_ animated: Bool) {
        let max: CGRect = UIScreen.main.bounds
        let snap1 = UISnapBehavior(item: self.gravity, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2 - 50))
        let snap2 = UISnapBehavior(item: self.push, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2 ))
        let snap3 = UISnapBehavior(item: self.attachment, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2 + 50))
        snap1.damping = 1
        snap2.damping = 2
        snap3.damping = 4
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
    }
    @IBAction func gravity(_ sender: UIButton) {
        animator.removeAllBehaviors()
        
        let gravity = UIGravityBehavior(items: [self.gravity,self.push,self.attachment])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [self.gravity,self.push,self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    @IBAction func push(_ sender: UIButton) {
        animator.removeAllBehaviors()
        let push = UIPushBehavior(items: [self.gravity,self.push,self.attachment], mode: .instantaneous)
        push.magnitude = 2
        
        animator.addBehavior(push)
        
        collision = UICollisionBehavior(items: [self.gravity,self.push,self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    
    @IBAction func attachment(_ sender: UIButton) {
        animator.removeAllBehaviors()
        let anchorPoint = CGPoint(x: self.attachment.center.x, y: self.attachment.center.y)
        attachmentBehavior = UIAttachmentBehavior(item: self.attachment, attachedToAnchor: anchorPoint)
        attachmentBehavior!.frequency = 0.5
        attachmentBehavior!.damping = 2
        attachmentBehavior!.length = 20
        animator.addBehavior(attachmentBehavior!)
        collision = UICollisionBehavior(items: [self.push, self.gravity, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    @IBAction func handleAttachment(_ sender: UIPanGestureRecognizer) {
        if((attachmentBehavior) != nil){
            attachmentBehavior!.anchorPoint = sender.location(in: self.view)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

