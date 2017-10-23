//
//  ViewController.swift
//  GuessNumbers
//
//  Created by peimin tsai on 2017/10/18.
//  Copyright © 2017年 perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var answer = Int(arc4random_uniform(100) + 1)
    
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func guessButton(_ sender: UIButton) {
        print("Answer is \(answer)")
        
        if isOver == false {
            let guestNumber = Int(inputField.text!)
            inputField.text = ""
            
            if guestNumber == nil {
                messageLabel.text = "請輸入數字 \(minNumber) ~ \(maxNumber)"
            } else {
                
                if guestNumber! > maxNumber {
                    messageLabel.text = "數字太大，範圍是 \(minNumber) ~ \(maxNumber)"
                } else if guestNumber! < minNumber {
                    messageLabel.text = "數字太小，範圍是 \(minNumber) ~ \(maxNumber)"
                } else {
                    if guestNumber! == answer {
                        messageLabel.text = "答對！，點選「我猜！！」可以重新玩"
                        isOver = true
                        
                    } else {
                        if guestNumber! > answer {
                            maxNumber = guestNumber!
                        } else {
                            minNumber = guestNumber!
                        }
                        messageLabel.text = "再試試，密碼的範圍是 \(minNumber) ~ \(maxNumber)"
                    }
                }
            }
        } else {
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "請輸入數字 \(minNumber) ~ \(maxNumber)"
            answer = Int(arc4random_uniform(100) + 1)
            isOver = false
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

