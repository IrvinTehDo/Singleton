//
//  ViewController.swift
//  Counter
//
//  Created by jefferson on 9/12/16.
//  Copyright © 2016 tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - ivars -
    var cb:CounterBrain!
    
    
    // an "Immediately Invoked Closure Expression"  - IICE - "Icky"
    var formatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    // MARK: - Outlets -
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: - ViewController lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        cb = CounterBrain(total: MyAppData.shared.counterTotal)
        displayTotal()
        displayDate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions -
    @IBAction func clearTapped(_ sender: AnyObject) {
        cb.clear()
        displayTotal()
    }
    @IBAction func plusTapped(_ sender: AnyObject) {
        cb.increment()
        displayTotal()
        //MyAppData.shared.
    }

    @IBAction func minusTapped(_ sender: AnyObject) {
        cb.decrement()
        displayTotal()
    }
    
    // MARK: - Helpers -
    private func displayTotal(){
        totalLabel.text = String(cb.total)
        displayDate()
    }
    
    private func displayDate(){
        let date = Date()
        MyAppData.shared.dateString = formatter.string(from: date)
        dateLabel.text = "Last used: \( MyAppData.shared.dateString)"
    }

}

