//
//  ViewController.swift
//  Quizzler
//
//  Created by Эльдар Ахатов on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabelOutlet: UILabel!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    @IBOutlet weak var trueButtonOutlet: UIButton!
    @IBOutlet weak var falseButtonOutlet: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    var quizBrain = QuizBrain()
    var userScore = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
   
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
     
        
        if userGotItRight {
            sender.backgroundColor = .green
           
            //view.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = .red
            // view.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
       
        
        
    }
    
    
    @objc func updateUI() {
        questionLabelOutlet.text = quizBrain.getQuestionText()
        progressViewOutlet.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButtonOutlet.backgroundColor = .clear
        falseButtonOutlet.backgroundColor = .clear
        
        
    }
    
    
}

/*
 
ProgressBar должна отображать прогресс прохождения вопросов.
 
 После перехода в новый цикл Бар должен обнулиться.
 
 
 
 */
