//
//  page2ViewController.swift
//  4points
//
//  Created by ming on 2016. 8. 10..
//  Copyright © 2016년 C4TK. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController{
    
    @IBOutlet var StackView: UIStackView!
    var position:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        position = self.StackView.frame.origin.y
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(
            1.0, delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.StackView.alpha = 1.0
                self.StackView.frame.origin.y = self.position - 10
            }, completion: nil
        )
    }
    override func viewWillDisappear(animated: Bool) {
        //self.StackView.frame.origin.y = self.position
    }
    override func viewDidDisappear(animated: Bool) {
        //self.StackView.alpha = 0.0
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}