//
//  ViewController.swift
//  Test
//
//  Created by BenLacroix on 17/06/2015.
//  Copyright (c) 2015 BenLacroix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputData: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var labelData: UILabel!
    var messageArray = [String]()
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource = self
        
        self.getData()
        
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("arrayRefresh"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func arrayRefresh() {
        
        tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TextCell") as! TextCell
        cell.dataLabel.text = self.messageArray[indexPath.row]
        cell.backgroundColor = UIColor.yellowColor()
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func saveData(sender: UIButton) {
        
        var object = PFObject(className: "Countries")
        object.setObject(self.inputData.text, forKey: "message")
        object.save()
        self.inputData.resignFirstResponder() // pour le clavier
        self.labelData.text = "Text envoyé dans Parse"
        //let predicate = NSPredicate(format: "playerName = 'Dan Stemkosk'")
        //var query = PFQuery(className: "Countries", predicate: predicate)
        self.getData()
    }
    
    func getData()
    {
        var query = PFQuery(className:"Countries") //Correspond à la table
        
        query.selectKeys(["message"]) // Correspond à la column de la classe
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            for messageObject in objects! {
                let messageText:String? = (messageObject as! PFObject)["message"] as? String
                if messageText != nil {
                    self.messageArray.append(messageText!)
                }
            }
        }
        self.tableView.reloadData()

    }
}

