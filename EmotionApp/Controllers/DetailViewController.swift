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
    
    @IBOutlet weak var resetButton: UIButton!
    
    lazy var viewArray: [UIView] = [ firstResult, secondResult, thirdResult, fourthResult, fifthResult ]
    
    lazy var scoreArray: [UILabel] = [firstScore, secondScore, thirdScore, fourthScore, fifthScore]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundColors()
        resetButtonSettings()
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
    
    func resetButtonSettings() {
        resetButton.titleLabel?.font = .systemFont(ofSize: 20)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .black
        resetButton.layer.cornerRadius = 22
        resetButton.clipsToBounds = true
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Reset", message: "전부 리셋할까용?",
                                      preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { _ in
            if var counted = UserDefaults.standard.array(forKey: "ScoreCount") as? [Int] {
                for i in 0...counted.count-1 {
                    counted[i] = 0
                }
                for (i, j) in self.scoreArray.enumerated() {
                    j.text = String(counted[i])
                }
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}
