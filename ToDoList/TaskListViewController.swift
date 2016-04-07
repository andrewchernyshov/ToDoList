//
//  ViewController.swift
//  ToDoList
//
//  Created by Andrew Chernyhov on 06.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTaskButtonPressed(sender: UIBarButtonItem) {
        
        let editVC = storyboard!.instantiateViewControllerWithIdentifier("EditViewController");
        self.presentViewController(editVC, animated: false, completion: nil)
        
    }
    var toDoList = NSUserDefaults.standardUserDefaults().objectForKey("taskList") ?? [NSDictionary]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - TableView Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let task = toDoList [indexPath.row] as! NSDictionary
        
        cell.textLabel?.text = task.valueForKey("title") as? String
        cell.detailTextLabel?.text = task.valueForKey("task") as? String

        
        
        return cell
    }
            
            
            
    
    
    
    

}

