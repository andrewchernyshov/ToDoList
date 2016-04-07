//
//  EditViewController.swift
//  ToDoList
//
//  Created by Andrew Chernyhov on 06.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        
        var task = ["title" : "", "task" : ""]
        if let title = titleTextField.text {
            task.updateValue(title, forKey: "title")
        }
        
        if let toDo = taskTextField.text {
            task.updateValue(toDo, forKey: "task")
        }
        
        NSUserDefaults.standardUserDefaults().setObject([task], forKey: "taskList")
        
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveButton.enabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.textFieldDidChange(_:)), name: UITextFieldTextDidChangeNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    func textFieldDidChange(notification:NSNotification) {
    
        if let _ = titleTextField.text {
            saveButton.enabled = true
        } else {
            if let _ = taskTextField.text {
                saveButton.enabled = true
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//        
//        NSNotificationCenter.defaultCenter().removeObserver(self, forKeyPath: UITextFieldTextDidChangeNotification)
    }
        
    }
    
    
    

