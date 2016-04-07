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
        
        let editVC = storyboard!.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        editVC.saveCompletionBlock = {(userTask:NSDictionary) ->Void in
        self.saveUserTask(userTask: userTask)
        }
        self.presentViewController(editVC, animated: false, completion: nil)
        
    }
    
    var toDoList = NSUserDefaults.standardUserDefaults().objectForKey("taskList") as? [NSDictionary] ?? [NSDictionary]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func saveUserTask (userTask task:NSDictionary?) -> Void {
        
        if let currentTask = task {
            (toDoList.append(currentTask))
        }
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "taskList")
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
        
        let task = toDoList [indexPath.row]
        
        cell.textLabel?.text = task.valueForKey("title") as? String
        cell.detailTextLabel?.text = task.valueForKey("task") as? String
        
        return cell
    }

    
    //MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let editVC = storyboard!.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        editVC.saveCompletionBlock = {(userTask:NSDictionary) ->Void in
            self.saveUserTask(userTask: userTask)
        }
        self.presentViewController(editVC, animated: false, completion: {
            let chosenTask = self.toDoList.removeAtIndex(indexPath.row)
            self.saveUserTask(userTask: nil)
            editVC.taskTextField.text = chosenTask.valueForKey("task") as? String
            editVC.titleTextField.text = chosenTask.valueForKey("title") as? String
        })
        
    }
}

