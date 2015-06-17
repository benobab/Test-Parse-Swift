//
//  ViewController.swift
//  Test
//
//  Created by BenLacroix on 17/06/2015.
//  Copyright (c) 2015 BenLacroix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputData: UITextField!
    @IBOutlet weak var labelData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(sender: UIButton) {
        
        var object = PFObject(className: "Countries")
        object.setObject(self.inputData.text, forKey: "message")
        object.save()
                self.labelData.text = "Text envoyé dans Parse"
    
    }

}

