//
//  DetailViewController.swift
//  EmotionApp
//
//  Created by LOUIE MAC on 2023/07/25.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstResult: UIView!
    @IBOutlet weak var secondResult: UIView!
    @IBOutlet weak var thirdResult: UIView!
    @IBOutlet weak var fourthResult: UIView!
    @IBOutlet weak var fifthResult: UIView!
    
    @IBOutlet weak var firstScore: UILabel!
    @IBOutlet weak var secondScore: UILabel!
    @IBOutlet weak var thirdScore: UILabel!
    @IBOutlet weak var fourthScore: UILabel!
    @IBOutlet weak var fifthScore: UILabel!
    
    
    lazy var viewArray: [UIView] = [ firstResult, secondResult, thirdResult, fourthResult, fifthResult ]
    
    lazy var scoreArray: [UILabel] = [firstScore, secondScore, thirdScore, fourthScore, fifthScore]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let count = UserDefaults.standard.array(forKey: "ScoreCount") as? [Int] {
            for (i, j) in scoreArray.enumerated() {
                j.text = String(count[i])
            }
        } else {
            return
        }
    }
    
    func setupBackgroundColors() {
        for (i, j) in viewArray.enumerated() {
            j.backgroundColor = Status.bgColor(rawValue: Int(i+1))?.backgroundColor
            j.layer.cornerRadius = 22
            j.clipsToBounds = true
        }
    }

}
