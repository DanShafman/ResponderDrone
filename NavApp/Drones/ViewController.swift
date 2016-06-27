//
//  ViewController.swift
//  Drones
//
//  Created by Dan Shafman on 6/24/16.
//  Copyright © 2016 Dan Shafman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var fieldLabelSmall: UILabel!
    @IBOutlet weak var fieldButton: UIButton!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var fre: UIStackView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    let algorithms = Algorithms()
    var timer = NSTimer.init()
    var deactivate: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.hidesWhenStopped = true
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: false)
        answer.enabled = false
        fieldButton.addTarget(self, action: #selector(ViewController.pressed), forControlEvents: UIControlEvents.AllTouchEvents)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pressed() {
        loader.startAnimating()
        timer.fire()
        while deactivate != true {}
        loader.stopAnimating()
        let output: String = algorithms.findDistance(address1.text!, address2: address2.text!)
        answer.text = output
    }
    
    func timerFunc() {
        deactivate = true
    }


}

