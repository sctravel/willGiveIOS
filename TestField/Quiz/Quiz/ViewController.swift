//
//  ViewController.swift
//  Quiz
//
//  Created by Cyrus Zhang on 1/31/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var CorrectAnswer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("Hello")
        RandomQuestions()
        Hide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func RandomQuestions() {
        var RandomNumber = arc4random() % 4
        RandomNumber += 1
        
        switch (RandomNumber) {
        case 1:
            QuestionLabel.text = "What is my first name?"
            Button1.setTitle("John", forState: UIControlState.Normal)
            Button2.setTitle("Cyrus", forState: UIControlState.Normal)
            Button3.setTitle("Larry", forState: UIControlState.Normal)
            Button4.setTitle("Steve", forState: UIControlState.Normal)
            CorrectAnswer = "2"
            break
        case 2:
            QuestionLabel.text = "What is my last name?"
            Button1.setTitle("Davidson", forState: UIControlState.Normal)
            Button2.setTitle("Jarod", forState: UIControlState.Normal)
            Button3.setTitle("Zhang", forState: UIControlState.Normal)
            Button4.setTitle("Wang", forState: UIControlState.Normal)
            CorrectAnswer = "3"
            break
        case 3:
            QuestionLabel.text = "Who is my honey?"
            Button1.setTitle("Cherry", forState: UIControlState.Normal)
            Button2.setTitle("Apple", forState: UIControlState.Normal)
            Button3.setTitle("Melon", forState: UIControlState.Normal)
            Button4.setTitle("Peach", forState: UIControlState.Normal)
            CorrectAnswer = "1"
            break
        case 4:
            QuestionLabel.text = "What's your favorite sport to play?"
            Button1.setTitle("Soccer", forState: UIControlState.Normal)
            Button2.setTitle("Table tennis", forState: UIControlState.Normal)
            Button3.setTitle("Badminton", forState: UIControlState.Normal)
            Button4.setTitle("Basketball", forState: UIControlState.Normal)
            CorrectAnswer = "4"
            break
        default: break
        }
    }
    
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NextButton: UIButton!
    
    @IBAction func Button1Pressed(sender: AnyObject) {
        Unhide()
        if(CorrectAnswer == "1") {
            NSLog("You are correct")
            ResultLabel.text = "you are correct"
        }
        else {
            NSLog("WRONG!!!")
            ResultLabel.text = "WRONG!!!"
        }
    }
    
    @IBAction func Button2Pressed(sender: AnyObject) {
        Unhide()
        if(CorrectAnswer == "2") {
            NSLog("You are correct")
            ResultLabel.text = "you are correct"
        }
        else {
            NSLog("WRONG!!!")
            ResultLabel.text = "WRONG!!!"
        }
    }
    
    @IBAction func Button3Pressed(sender: AnyObject) {
        Unhide()
        if(CorrectAnswer == "3") {
            NSLog("You are correct")
            ResultLabel.text = "you are correct"
        }
        else {
            NSLog("WRONG!!!")
            ResultLabel.text = "WRONG!!!"

        }
    }

    @IBAction func Button4Pressed(sender: AnyObject) {
        Unhide()
        if(CorrectAnswer == "4") {
            NSLog("You are correct")
            ResultLabel.text = "you are correct"
        }
        else {
            NSLog("WRONG!!!")
            ResultLabel.text = "WRONG!!!"

        }
    }
    
    @IBAction func Next(sender: AnyObject) {
        RandomQuestions()
        Hide();
    }
    
    func Hide() {
        ResultLabel.hidden = true
        NextButton.hidden = true
    }
    
    func Unhide() {
        ResultLabel.hidden = false
        NextButton.hidden = false
    }
    
}

