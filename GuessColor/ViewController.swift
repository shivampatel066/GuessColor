//
//  ViewController.swift
//  GuessColor
//
//  Created by Shivam on 31/03/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rgbLabel: UILabel!       //Labels
    @IBOutlet weak var youWonLabel: UILabel!
    
    @IBOutlet weak var one: UIButton!           //Buttons
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    
    
    
    
    var randomNumberLimit = 3       //Initial limit(Number of colour buttons) for beginners is 3.
    var MainColourChoice = 0        //Main colour button Selected Choice by Random Number Generator from 1 to numberlimit.
    var redMain :Int = 0            //Storing the rgb components for Main Selected Colour.
    var greenMain :Int = 0
    var blueMain :Int = 0
    
    var redTemp :Int = 0            //Temp for Storing the rgb components which then to compare with main colour to check results.
    var greenTemp :Int = 0
    var blueTemp :Int = 0
    
    
    var colourClickedButton = 0    //Variable for Storing the tag received from sender button.
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        one.isHidden = true
        two.isHidden = true
        three.isHidden = true
        four.isHidden = true
        five.isHidden = true
        six.isHidden = true
        seven.isHidden = true
        eight.isHidden = true
        nine.isHidden = true
    }


    
    @IBAction func beginner(_ sender: Any) {
        applyRoundCorners()                         //Apply round corner to all buttons.
        one.isHidden = false                        //Displaying only 3 colour buttons for Beginners Difficulty.
        two.isHidden = false
        three.isHidden = false
        four.isHidden = true                        //Hiding all the other Buttons.
        five.isHidden = true
        six.isHidden = true
        seven.isHidden = true
        eight.isHidden = true
        nine.isHidden = true
        youWonLabel.alpha = 0                       //Hiding Youwon Label in the Beginning will display once the user selects any colour button.
        
        
        randomNumberLimit = 3                       //Setting Limit As per difficulty.
        generateRandomColours()                     //Generating random Colours for all buttons.
        generateRandomMainColour()                  //Selecting a random main colour to show to users.
        setLabelAsMainColour()                      //Inflating the RGB Label with rgb components of main colour selected randomly.
        
    }
    
    @IBAction func intermediate(_ sender: Any) {
        applyRoundCorners()
        one.isHidden = false
        two.isHidden = false
        three.isHidden = false
        four.isHidden = false
        five.isHidden = false
        six.isHidden = false
        seven.isHidden = true
        eight.isHidden = true
        nine.isHidden = true
        youWonLabel.alpha = 0
        randomNumberLimit = 6
        generateRandomColours()
        generateRandomMainColour()
        setLabelAsMainColour()
        
        
        
    }
    
    @IBAction func advanced(_ sender: Any) {
        applyRoundCorners()
        one.isHidden = false
        two.isHidden = false
        three.isHidden = false
        four.isHidden = false
        five.isHidden = false
        six.isHidden = false
        seven.isHidden = false
        eight.isHidden = false
        nine.isHidden = false
        youWonLabel.alpha = 0
        
        randomNumberLimit = 9
        generateRandomColours()
        generateRandomMainColour()
        setLabelAsMainColour()
    }
    
    
    @IBAction func colourClicked(_ sender: Any) { //Action Button For Buttons(1-9) Clicked.
        
        colourClickedButton = (sender as AnyObject).tag //fetching the tag of the button.
        fetchColour()
        checkAndShowResult()
        
    }
    
    
    
    
    
    
    func applyRoundCorners() {              //applying Round Buttons to User Interface.
        
        let edgeValue = 25
        one.layer.cornerRadius = CGFloat(edgeValue)
        two.layer.cornerRadius = CGFloat(edgeValue)
        three.layer.cornerRadius = CGFloat(edgeValue)
        four.layer.cornerRadius = CGFloat(edgeValue)
        five.layer.cornerRadius = CGFloat(edgeValue)
        six.layer.cornerRadius = CGFloat(edgeValue)
        seven.layer.cornerRadius = CGFloat(edgeValue)
        eight.layer.cornerRadius = CGFloat(edgeValue)
        nine.layer.cornerRadius = CGFloat(edgeValue)
        
        
    }
    
    func generateRandomColours() {          //Generating Random Colours for all buttons.
        
        one.backgroundColor = UIColor.random
        two.backgroundColor = UIColor.random
        three.backgroundColor = UIColor.random
        four.backgroundColor = UIColor.random
        five.backgroundColor = UIColor.random
        six.backgroundColor = UIColor.random
        seven.backgroundColor = UIColor.random
        eight.backgroundColor = UIColor.random
        nine.backgroundColor = UIColor.random
        
        
    }
    
    
    
    func generateRandomMainColour() {  //Setting an random value to the MainColourChoice which will then shown to users through RGB Label.
        
        MainColourChoice = Int.random(in: 1...randomNumberLimit) //Setting random variable between 1 to randomNumberLimit which is set by the Difficulty buttons.
        
    }
    
    func setLabelAsMainColour() { //Setting the RGB Label with respective rgb components of Main Colour Selected.
        
        switch MainColourChoice { //MainColourChoice is the variable to Store the main colour generated randomly by generateRandomMainColour().
        case 1:                   //if MainColourChoice is 1st Colour Button.
            let bgColour = one.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) { //getRed func used to fetch rgb components of UIColor
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)             //Converting blue component to int value to show the Users round off value. else it displays 0.1923232323232323
            }
        case 2:
            let bgColour = two.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
                
                
            }
        case 3:
            let bgColour = three.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
          
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
              
                
            }
        case 4:
            let bgColour = four.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
              
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
             
                
                
            }
        case 5:
            let bgColour = five.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
              
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
                
                
                
            }
        case 6:
            let bgColour = six.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
               
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
           
                
                
            }
        case 7:
            let bgColour = seven.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
               
                
                
            }
        case 8:
            let bgColour = eight.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
               
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
               
                
                
            }
        case 9:
            let bgColour = nine.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                redMain = Int(r * 255)
                greenMain = Int(g * 255)
                blueMain = Int(b * 255)
            }
            
        default:
            print("error")
        }
        rgbLabel.text = "RGB \(redMain), \(greenMain), \(blueMain)" //Changing the RGB Label to the selected Main Colour.
    }
    
    
    
    //Function to fetch Colour components(R,G,B) from clicked colour button
    func fetchColour() {
        switch colourClickedButton { //colourClickedButton having button tag to access which button was pressed.
        case 1:         // case 1 if sender tag == 1
            let bgColour = one.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) { //getRed func to get the rgb components of the selected UIColor.
                
                redTemp = Int(r * 255)          //Converting to Int And Storing
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 2:
            let bgColour = two.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 3:
            let bgColour = three.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 4:
            let bgColour = four.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 5:
            let bgColour = five.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 6:
            let bgColour = six.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 7:
            let bgColour = seven.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 8:
            let bgColour = eight.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        case 9:
            let bgColour = nine.backgroundColor!
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            if bgColour.getRed(&r, green: &g, blue: &b, alpha: &a) {
                
                redTemp = Int(r * 255)
                greenTemp = Int(g * 255)
                blueTemp = Int(b * 255)
                
            }
        
            
        default:
            print("error")
            
        }
        
    }
    
    
    //Compare Main Colour Components(redMain...) with Clicked Colour Components(redTemp...)
    func checkAndShowResult() {
        if redMain == redTemp && greenMain == greenTemp && blueMain == blueTemp {
            youWonLabel.alpha = 1.0
            
        } else {
            youWonLabel.alpha = 0
        }
        
        
    }
    
}

//extension in UIColor for creating random function for generating random colours
extension UIColor {
    /**
     * Returns random color
     * EXAMPLE: self.backgroundColor = UIColor.random
     */
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0 ... 1)
        let g:CGFloat  = .random(in: 0 ... 1)
        let b:CGFloat  = .random(in: 0 ... 1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

