//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True, False
//        let actualAnswer = quiz[questionNumber][1]
//        let actualAnswer = quiz[questionNumber].answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

//        if userAnswer == actualAnswer {
        if userGotItRight {
//            print("Right!")
            sender.backgroundColor = UIColor.green
        } else {
//            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
//        questionLabel.text = quiz[questionNumber][0]
//        questionLabel.text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        
//        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        progressBar.progress = quizBrain.getProgress()
    }
    
}

