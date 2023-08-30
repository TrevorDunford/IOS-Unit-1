//
//  DMFindingGameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

/**
 1.1 Create the user interface in the `Main` file. See the provided screenshot for how the UI should look. Feel free to customize the colors, font, etc.
 */
class DMFindingGameViewController: UIViewController {
    
    @IBOutlet weak var targetletter: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    
    @IBOutlet var lettersbutton: [UIButton]!
    
    @IBAction func letterbutton(_ sender: Any) {
        
        }
    
    /**
     2.1 Create IBOutlets for the target letter label and the score label.
     2.2 Create an IBOutlet collection for the letter buttons.     */
    /**
     These variables will help us with the gameplay. You do not need to modify this code.
     */
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    /**
     We're starting a new round as soon as the screen loads. You do not need to modify this code.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    /**
     3.1 Assign the `targetLetter` variable to a random letter from the `letters` array.
     3.2 Call the `generateRandomLetters` function and assign the result to the `randomLetters` variable. Hint: We want the number of letters to be the number of letters buttons that we have.
     3.3 Call the `updateTargetLetterLabel` and `updateLetterButtons` functions.
     */
    func newRound() {
        targetLetter = letters.randomElement()!
        randomLetters = generateRandomLetters(numLetters: lettersbutton.count)
        updateScoreLabel()
        updateTargetLetterLabel()
        updateLetterbuttons()
        
    }
    
        
    func updateTargetLetterLabel() {
        targetletter.text = "\(targetLetter)"
    }
    
    /**
     4.1 Return an array of letters. There should be as many letters as `numLetters`.
     The array should include the target letter. The rest of the letters should be random. A letter should show up in the array only once. The order of the letters should be random.
     
     This is a tricky function, but feel free to run the provided test in `DMFindingGameTests` to know if your code is correct. Let your Tech Lead know if you need help. :)
     */
    
    func generateRandomLetters(numLetters: Int) -> [String] {
        var randomArray: [String] = [targetLetter]
        for _ in 1..<numLetters {
            var randomLetter: String
            repeat {
                randomLetter = letters.randomElement()!

            } while randomArray.contains(randomLetter)

            randomArray.append(randomLetter)
        }
        
        return randomArray
    }
    //1. create an empty array -
    // put the target letter in the array manually
    //2. create a for loop that runs numLetters times
    //3. each time the loops runs, generating random letter and putting it into array, making sure there is no repeats of any letter. Use While loops in the for loops
    //4. return the array
    
    /**
     5.1 Check if the `selectedLetter` is equal to the `targetLetter` and update the `score` variable accordingly.
     Feel free to run the provided test in `DMFindingGameTests` to know if your code is correct.
     */
    func calculateNewScore(selectedLetter: String) {
        if
            selectedLetter == targetLetter
        { score += 1}
    }
    /**
     6.1 Create an IBAction that gets run when the user taps on a letter button.
     6.2 Call the `calculateNewScore` function and pass in the selected letter. Hint: You can get access to the selected letter using the `sender`'s `titleLabel`.
     6.3 Call the `newRound` function to start a new round.
     */
    
    /**
     7.1 Update the `targetLetterLabel`'s text to be the `targetLetter`.
     */
    
    
    
    /**
     8.1 Update the `scoreLabel`'s text to be the `score`.
     */
    func updateScoreLabel() {
        scorelabel.text = "\(score)"
    }
    
    /**
     9.1 Update the title of each button in the IBOutlet collection to be the random letter at the corresponding index in the `randomLetters` array.
     Hint: `UIButton`s have a `setTitle` function.
     */
    func updateLetterbuttons() {
        print (randomLetters)
        for (index, button) in lettersbutton.enumerated(){
            button.setTitle(randomLetters[index], for: .normal)
        }
    }
    
    
    
}
