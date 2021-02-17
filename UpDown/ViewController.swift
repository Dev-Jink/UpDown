//
//  ViewController.swift
//  UpDown
//
//  Created by MyeongJin on 2021/02/17.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    //MARK: IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var turnCountLabel: UILabel!
    @IBOutlet var inputFiled: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    //MARK: Stored Properties
    var randomNumber: UInt32 = 0
    var turnCount: Int = 0
    
    //MARK: - Methods
    @IBAction func tapBackground(_ sender: Any) {
        self.inputFiled.endEditing(true)
    }
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        guard let inputText = self.inputFiled.text, inputText.isEmpty == false else {
            print("입력값 없음")
            return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber < randomNumber {
            self.resultLabel.text = "UP!"
        } else if inputNumber > randomNumber {
            self.resultLabel.text = "DOWN!"
        } else {
            self.resultLabel.text = "정답입니다!"
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: Any) {
        self.initializeGame()
    }
    
    // MARK: Custom Methods
    func initializeGame() {
        
        self.randomNumber = arc4random() % 25
        self.turnCount = 0
        
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "\(turnCount)"
        self.inputFiled.text = nil
        
        print("random number : \(self.randomNumber)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        submitButton.addTarget(self, action: #selector(touchUpSubmitButton(_:)), for: .touchUpInside)
        
        self.initializeGame()
    }


}

