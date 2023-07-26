//
//  ViewController.swift
//  EmotionApp
//
//  Created by LOUIE MAC on 2023/07/25.
//

import UIKit

class MoodViewController: UIViewController {
    
    @IBOutlet weak var firstEmoji: UIImageView!
    @IBOutlet weak var secondEmoji: UIImageView!
    @IBOutlet weak var thirdEmoji: UIImageView!
    @IBOutlet weak var fourthEmoji: UIImageView!
    @IBOutlet weak var fifthEmoji: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    
    var scoreArray: [Int] = [0, 0, 0, 0, 0]
    
    lazy var buttonArray:[UIButton] = [ firstButton, secondButton, thirdButton, fourthButton, fifthButton]
    
    lazy var emojiArray:[UIImageView] = [firstEmoji, secondEmoji, thirdEmoji, fourthEmoji, fifthEmoji]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColors()
        emojiViewSettings()
        //        firstEmoji.image = UIImage(named: "emoji1")
        
    }
    
    func setupBackgroundColors() {
        for (i, j) in buttonArray.enumerated() {
            j.backgroundColor = Status.bgColor(rawValue: Int(i+1))?.backgroundColor
        }
    }
    
    func emojiViewSettings() {
        for (i, j) in emojiArray.enumerated() {
            if let emoji = Status.bgColor(rawValue: i+1)?.emojiSetup {
                j.image = emoji
            }
        }
    }
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        scoreArray[sender.tag-1] += 1
        UserDefaults.standard.set(scoreArray, forKey: "ScoreCount")
        let imageView = emojiArray[sender.tag-1]
        UIView.animate(withDuration: 0.1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                imageView.transform = .identity
            }
        }
    }
}

