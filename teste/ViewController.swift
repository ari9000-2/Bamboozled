//
//  ViewController.swift
//  teste
//
//  Created by Si Suo on 2020/8/22.
//  Copyright © 2020 Ariadne Si Suo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = ["Who was once Chandler's secretary?","What are Ross and Monica’s parents called?","To get over Richard, what did Monica start making?","Which of the girls did Joey mistakenly see in the shower?","What was Chandler's position after getting promoted?",]
    let answers = [["Phoebe","Monica","Joey","Rachel"],["Jack and Judy","Jack and Jill","Philip and Holly","Margaret and Peter"],["Jam","Marmalade","Candy","Pancakes"],["Monica","Phoebe","Rachel","None"],["Processing Supervisor","Data Processor","Senior Accountant","Senior Analyst"]]
    
    // variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    //label
    @IBOutlet weak var lbl: UILabel!
    
    //buttons
    
    @IBAction func action(_ sender: Any) {
        if((sender as AnyObject).tag == Int(rightAnswerPlacement)){
            print("correct")
            points += 10
        }
        else{
            print("wrong")
        }
        if(currentQuestion != questions.count){
            newQuestion()
        }
        else if(currentQuestion == questions.count){
            endQuiz()
        }
    }
    override func viewDidAppear(_ animated:Bool){
        newQuestion()
        
    }
    // function that calls new question
    func newQuestion(){
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(4)+1
        
        //create a button
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...4 {
            button = view.viewWithTag(i) as! UIButton
            if(i == Int(rightAnswerPlacement)){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else if(x == 1){
                button.setTitle(answers[currentQuestion][x],for: .normal)
                x = 2
            }
            else{
                button.setTitle(answers[currentQuestion][x],for: .normal)
                x = 3
            }
        }
        currentQuestion += 1
    }
    
    func endQuiz(){
        if points == 50 {
           performSegue(withIdentifier: "pass", sender: self)
        }
        else {
            performSegue(withIdentifier: "fail", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

