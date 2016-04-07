//
//  EditViewController.swift
//  ToDoList
//
//  Created by Andrew Chernyhov on 06.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit


class EditViewController: UIViewController, UITextFieldDelegate {
    
    var saveCompletionBlock: ((NSDictionary) -> Void)?
    var taskToEdit:NSDictionary?

    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        saveButtonPressed(sender)
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
        
        if let completion = saveCompletionBlock {
            completion(task)
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var removeButton: UIButton!
    
    @IBAction func removeTaskButtonIsPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveButton.enabled = false
        removeButton.enabled = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.textFieldDidChange(_:)), name: UITextFieldTextDidChangeNotification, object: nil)
        if titleTextField.text?.isEmpty != nil || taskTextField.text != nil {
            removeButton.enabled = true
        }
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
            removeButton.enabled = true
        } else {
            if let _ = taskTextField.text {
                saveButton.enabled = true
                removeButton.enabled = true
            }
        }
    }
    
}
    
    
    

