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
        UIView.animate(withDuration: 2) {
            self.lambdaImageView.alpha = 0
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.lLabel)
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.a1Label)
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.mLabel)
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.bLabel)
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.dLabel)
        }
        DispatchQueue.main.async {
            self.animateLabel(with: self.a2Label)
        }
    }
    
    private func stopAnimations () {
        animating = false
        DispatchQueue.main.async {
            while self.numAnimating != 0 {
                pause()
            }
            UIView.animate(withDuration: 2) {
                self.lambdaImageView.alpha = 1
            }
        }
    }

    private func randomMoveCenterToPoint(for view: UIView) -> CGPoint {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        //Pick a direction
        switch Int.random(in: 1...4) {
        case 1: //Top
            let x = CGFloat.random(in: viewWidth/2...screenWidth-(viewWidth/2))
            let y = viewHeight/2
            return CGPoint(x: x, y: y)
        case 2: //Right
            let x = screenWidth-(viewWidth/2)
            let y = CGFloat.random(in: viewHeight/2...screenHeight-(viewHeight/2))
            return CGPoint(x: x, y: y)
        case 3: //Bottom
            let x = CGFloat.random(in: viewWidth/2...screenWidth-(viewWidth/2))
            let y = screenHeight - (viewHeight/2)
            return CGPoint(x: x, y: y)
        case 4: //Left
            let x = viewWidth/2
            let y = CGFloat.random(in: viewHeight/2...screenHeight-(viewHeight/2))
            return CGPoint(x: x, y: y)
        default:
            return CGPoint()
        }
    }
    
    private func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
    
    private func randomDuration() -> TimeInterval {
        return Double.random(in: 3...6)
    }
    
    private func animateLabel (with label: UILabel) {
        var firstTime = true
        var oldPosition: CGPoint?
        if firstTime {
            oldPosition = label.center
            self.numAnimating += 1
        }
        if animating {
            firstTime = false
            label.textColor = self.randomColor()
            label.backgroundColor = self.randomColor()
            UIView.animate(withDuration: randomDuration()) {
                label.center = self.randomMoveCenterToPoint(for: label)
            }
            animateLabel(with: label)
        } else {
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.white
            UIView.animate(withDuration: randomDuration()) {
                label.center = oldPosition!
            }
            self.numAnimating -= 1
        }
    }

}



