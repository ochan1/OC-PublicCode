//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteCategoryTextField: UITextField!

    @IBOutlet weak var noteDueDateTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 1
        if let note = note {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
            noteCategoryTextField.text = note.category
            noteDueDateTextField.text = note.dueDate
        } else {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
            noteCategoryTextField.text = ""
            noteDueDateTextField.text = ""
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
                
                // 1
                //let note = Note()
                let note = CoreDataHelper.newNote()
                // 2
                note.title = "crash point"
                note.title = noteTitleTextField.text ?? ""     //crash point
                note.content = noteContentTextView.text ?? ""
                // 3
                note.modificationTime = Date() as NSDate
            }
        }
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.category = noteCategoryTextField.text ?? ""
            note.dueDate = noteDueDateTextField.text ?? ""
            note.modificationTime = Date() as NSDate  //"Date()" will be "optional" because not always perfect, meaning will create a "nil" since the data is not always there (esp when there are no Notes available, meaning need to be forced unwrapped
            CoreDataHelper.saveNote()
        }
    }
}
