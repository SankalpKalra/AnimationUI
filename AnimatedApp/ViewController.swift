//
//  ViewController.swift
//  AnimatedApp
//
//  Created by Appinventiv on 10/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var password: shakingTextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var username: shakingTextField!
    @IBOutlet weak var facebook: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reset()
        password.delegate=self
        username.delegate=self
    }
    
    func reset()
    {
        self.facebook.center.y = 0
        self.username.center.x = -135
        self.password.center.x = 510
        self.login.center.x = -65
        self.signUp.center.x = 440
    }
    
    
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == username{
        username.shake()
        }
        else{
        password.shake()
        }
    }
   
    func resetAnim(){
        UIView.animate(withDuration: 1, delay: 2, options: [.curveEaseInOut], animations: {
            self.facebook.transform = CGAffineTransform.identity}) { (true) in
                UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseIn], animations: {
                    self.username.transform = CGAffineTransform.identity
                }, completion: { (true) in
                    UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseIn], animations: {
                        self.password.transform = CGAffineTransform.identity
                    }, completion: { (true) in
                        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
                            self.login.transform = CGAffineTransform.identity
                        }, completion: { (true) in
                            UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
                                self.signUp.transform = CGAffineTransform.identity
                            }, completion: nil)
                        })
                    })
                    
                })
                
                
                
        }
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
        self.resetAnim()
        let resetButton = sender
        let bounds = resetButton.bounds
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            resetButton.bounds=CGRect(x: bounds.origin.x-30, y: bounds.origin.y, width: bounds.size.width+60, height: bounds.size.height)
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                resetButton.bounds=bounds
            })
        }
        
    }
    
    @IBAction func showAnimation(_ sender: UIButton) {
        
        //self.reset()
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.facebook.transform = CGAffineTransform(translationX: 0, y: 180
            )}) { (true) in
                UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseIn], animations: {
                    self.username.transform = CGAffineTransform(translationX: 322.5, y: 0
                    )
                }, completion: { (true) in
                    UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseIn], animations: {
                        self.password.transform = CGAffineTransform(translationX: -322.5, y: 0
                        )
                    }, completion: { (true) in
                        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
                            self.login.transform = CGAffineTransform(translationX: 182.5, y: 0
                            )
                        }, completion: { (true) in
                            UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
                                self.signUp.transform = CGAffineTransform(translationX: -182.5, y: 0
                                )
                            }, completion: nil)
                    })
                })
                    
        })
        
       
        
    }
}
    
}

extension shakingTextField{
    
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration=0.05
        animation.repeatCount=5
        animation.autoreverses=true
        animation.fromValue=NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y))
        animation.toValue=NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y))
        self.layer.add(animation,forKey: "position")
    }
}

