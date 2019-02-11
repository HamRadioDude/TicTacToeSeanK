//
//  ViewController.swift
//  TicTacToe-SeanK
//
//  Created by student on 2/10/19.
//  Copyright © 2019 Sean Klechak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count:Int = 0

    var currentPlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0 ,0]
    let combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8], [2,4,6]]
    
    var active = true
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var WinnerLbl: UILabel!
    
    @IBAction func resetAction(_ sender: Any) {
         gameState = [0,0,0,0,0,0,0,0,0]
        active = true
        currentPlayer = 1
        count = 0
        
        
        for x in 1..<10 {
            if let button = view.viewWithTag(x) as? UIButton {
                button.setImage(nil, for: [])
               
                WinnerLbl.isHidden = true
                resetBtn.isHidden = true
                
            
            }
        }
        
    }
    
    
    @IBAction func btnPress(_ sender: AnyObject) {
        let curPos = sender.tag - 1
        if gameState[curPos] == 0  && active {
            count += 1
            print(count)
        gameState[curPos] = currentPlayer
            
            if currentPlayer == 1 {
                sender.setImage(UIImage(named: "x-png-35414.png"), for: [])
                currentPlayer = 2
                
            } else {
                sender.setImage(UIImage(named: "letter-o-icon-png-20921.png"), for: [])
                currentPlayer = 1
            }
           
            for winner in combos {
                if gameState[winner[0]] != 0 && gameState[winner[0]] == gameState[winner[1]] && gameState[winner[1]] == gameState[winner[2]] || gameState[winner[0]] != 0 && gameState[winner[0]] != gameState[winner[1]] && gameState[winner[1]] != gameState[winner[2]] && count == 9 {
                    
                    

             active = false
                 
                    if gameState[winner[0]] == 1 && count < 9 {
                        WinnerLbl.text = "X's Win"
                        print("X")
//                    } else if gameState[winner[0]] == 2 {
                    } else if gameState[winner[0]] == 2 && count <= 8  {
                        WinnerLbl.text = "O's Win"
                        print("O")
//                    } else if count == 9 && gameState[winner[0]] == 0{
//                        WinnerLbl.text = "Draw"
//                        print("DRAW")
                    } else {
                        WinnerLbl.text = "Draw"
                        print("Draw test")
                    }

             WinnerLbl.isHidden = false
             resetBtn.isHidden = false
                    count = 0
                    

               
                }
               
                
            }

        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WinnerLbl.isHidden = true
        resetBtn.isHidden = true
    }


}

