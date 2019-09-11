//
//  ViewController.swift
//  scatter-and-gather
//
//  Created by Joshua Sharp on 9/10/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animating: Bool = false
    var numAnimating: Int = 0
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    @IBOutlet weak var lambdaImageView: UIImageView!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    @IBOutlet weak var navButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    @IBAction func buttonTapped(_ sender: UIBarButtonItem) {
        if !animating {
            startAnimation()
            navButton.title = "Gather"
        } else {
            stopAnimations()
            navButton.title = "Scatter"
        }
    }
    
    
    private func startAnimation() {
        animating = true
        
        UIView.animate(withDuration: 2, animations: {
            self.lambdaImageView.alpha = 0
        }) { (_) in
            self.lLabel.textColor = self.randomColor()
            self.lLabel.backgroundColor = self.randomColor()
            let point1 = self.randomPoint(for: self.lLabel)
            self.lLabel.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point1.x, y: point1.y))
            
            self.a1Label.textColor = self.randomColor()
            self.a1Label.backgroundColor = self.randomColor()
            let point2 = self.randomPoint(for: self.lLabel)
            self.a1Label.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point2.x, y: point2.y))
            
            self.mLabel.textColor = self.randomColor()
            self.mLabel.backgroundColor = self.randomColor()
            let point3 = self.randomPoint(for: self.lLabel)
            self.mLabel.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point3.x, y: point3.y))
            
            self.bLabel.textColor = self.randomColor()
            self.bLabel.backgroundColor = self.randomColor()
            let point4 = self.randomPoint(for: self.lLabel)
            self.a1Label.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point4.x, y: point4.y))
            
            self.dLabel.textColor = self.randomColor()
            self.dLabel.backgroundColor = self.randomColor()
            let point5 = self.randomPoint(for: self.lLabel)
            self.dLabel.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point5.x, y: point5.y))
            
            self.a2Label.textColor = self.randomColor()
            self.a2Label.backgroundColor = self.randomColor()
            let point6 = self.randomPoint(for: self.lLabel)
            self.a2Label.transform = CGAffineTransform(rotationAngle: self.randomRotation()).concatenating(CGAffineTransform(translationX: point6.x, y: point6.y))
            
        }
    }
    
    private func stopAnimations () {
        animating = false
        
        UIView.animate(withDuration: self.randomDuration(), delay: self.randomDuration(), animations: {
            self.lLabel.transform = .identity
            self.a1Label.transform = .identity
            self.mLabel.transform = .identity
            self.bLabel.transform = .identity
            self.dLabel.transform = .identity
            self.a2Label.transform = .identity
        }, completion: { (_) in
            self.lLabel.backgroundColor = .white
            self.lLabel.textColor = .black
            self.a1Label.backgroundColor = .white
            self.a1Label.textColor = .black
            self.mLabel.backgroundColor = .white
            self.mLabel.textColor = .black
            self.bLabel.backgroundColor = .white
            self.bLabel.textColor = .black
            self.dLabel.backgroundColor = .white
            self.dLabel.textColor = .black
            self.a2Label.backgroundColor = .white
            self.a2Label.textColor = .black
            self.lambdaImageView.alpha = 1
        })
    }
    
    private func randomRotation () -> CGFloat {
        return CGFloat.pi/CGFloat.random(in: 1...4)
    }

    private func randomPoint(for view: UILabel) -> CGPoint {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let x = CGFloat.random(in: viewWidth...screenWidth-(viewWidth))
        let y = CGFloat.random(in: viewHeight...screenHeight-(viewHeight))
        return CGPoint(x: x, y: y)
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
    
    private func randomDuration() -> TimeInterval {
        return Double.random(in: 2...4)
    }
}



