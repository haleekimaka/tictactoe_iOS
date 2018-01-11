//
//  ViewController.swift
//  ticTacToe
//
//  Created by Arin Halicki on 1/11/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player: Int = 1
    var gameOver: Bool = false
    var squareColor: [String] = ["gray","gray","gray","gray","gray","gray","gray","gray","gray"]


    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var winMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winMessage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetGame(_ sender: UIButton) {
        for button in buttons {
            button.backgroundColor = .lightGray
        }
        squareColor = ["gray","gray","gray","gray","gray","gray","gray","gray","gray"]
        winMessage.isHidden = true
        player = 1
        gameOver = false
    }
    
    @IBAction func selectedSquare(_ sender: UIButton) {
        if gameOver {
            return
        }
        else {
    //        print(sender.tag)
    //        print(sender.backgroundColor!)
            if (player == 1 && squareColor[sender.tag] == "gray"){
                sender.backgroundColor = .red
                squareColor[sender.tag] = "red"
                player += 1
                let someoneWon = checkWinConditions()
                print(someoneWon)
                if someoneWon.0 == true {
                    // set winMessage
                    winMessage.text = someoneWon.1
                    winMessage.isHidden = false
                }
            }
            else if(player == 2 && squareColor[sender.tag] == "gray"){
                sender.backgroundColor = .blue
                squareColor[sender.tag] = "blue"
                player -= 1
                let someoneWon = checkWinConditions()
                print(someoneWon)
                if someoneWon.0 == true {
                    // set winMessage
                    winMessage.text = someoneWon.1
                    winMessage.isHidden = false
                }
            }
        }
        

    }
    func checkWinConditions() -> (Bool, String){
        var count = 0
        var win = false
        var color = ""
        
        for val in squareColor {
            if val == "gray" {
                count += 1
            }
        }
        print("Gray count: \(count)")
        
        if count < 5 {
            if squareColor[0] == squareColor[1] && squareColor[1] == squareColor[2] && squareColor[0] != "gray"{
                win = true
                color = squareColor[0]
            }
            else if squareColor[3] == squareColor[4] && squareColor[4] == squareColor[5] && squareColor[3] != "gray"{
                win = true
                color = squareColor[3]
            }
            else if squareColor[6] == squareColor[7] && squareColor[7] == squareColor[8] && squareColor[6] != "gray"{
                win = true
                color = squareColor[6]
            }
            else if squareColor[0] == squareColor[3] && squareColor[3] == squareColor[6] && squareColor[0] != "gray"{
                win = true
                color = squareColor[0]
            }
            else if squareColor[1] == squareColor[4] && squareColor[4] == squareColor[7] && squareColor[1] != "gray"{
                win = true
                color = squareColor[1]
            }
            else if squareColor[2] == squareColor[5] && squareColor[5] == squareColor[8] && squareColor[2] != "gray"{
                win = true
                color = squareColor[2]
            }
            else if squareColor[0] == squareColor[4] && squareColor[4] == squareColor[8] && squareColor[0] != "gray"{
                win = true
                color = squareColor[0]
            }
            else if squareColor[2] == squareColor[4] && squareColor[4] == squareColor[6] && squareColor[2] != "gray"{
                win = true
                color = squareColor[2]
            }
            else{
                win = false
            }
            
        }
        if win == false && count == 0 {
            gameOver = true
            return(true,"Bummer. It's a cat's game!")
        }
        else if win == true {
            gameOver = true
            return(true, "Awesome, \(color) wins!")
        }
        
        return(false,"Keep playing")
        
    }
}

