//
//  ViewController.swift
//  Project09_AlertController
//
//  Created by milo on 16/12/17.
//  Copyright © 2016年 LFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func actionAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "MyTitle", message: "This is an alert", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("you have pressed the cancel button")
        }
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("you have pressed OK button")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func actionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "MyTitle", message: "This is an alert", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("you have pressed the cancel button")
        }
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("you have pressed OK button")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    @IBAction func actionAlertWithForm(_ sender: Any) {
        let alertController = UIAlertController(title: "My Title", message: "This is an alert", preferredStyle:UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("you have pressed the Cancel button");
        }
        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("you have pressed OK button");
            let userName = alertController.textFields![0].text
            let password = alertController.textFields![1].text
            self.doSomething(userName, password: password)
        }
        alertController.addAction(OKAction)
        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "User Name"
            textField.isSecureTextEntry = false
        }
        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true, completion: nil)
    }
    func doSomething(_ userName: String?, password: String?){
        print("username: \(userName ?? "") password :\(password ?? "")")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

