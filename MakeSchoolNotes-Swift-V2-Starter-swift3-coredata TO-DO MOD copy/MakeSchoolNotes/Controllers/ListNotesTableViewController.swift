//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

import CoreData

class ListNotesTableViewController: UITableViewController {
    
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var completed = [Note]()
    
    @IBAction func doneButton(_ sender: UIButton) {
        let button = sender
        let contentView = button.superview
        let cell = contentView?.superview     //Optional because no guarantee "superview" will be there, according to the code. Only you know.
        let index = tableView.indexPath(for: cell as! UITableViewCell)
        notes[(index?.row)!].doneYet = true
        let doneItem = notes.remove(at: (index?.row)!)
        completed.append(doneItem)
        CoreDataHelper.saveNote()
        tableView.reloadData()
    }
    
    @IBAction func notDoneButton(_ sender: UIButton) {
        let button = sender
        let contentView = button.superview
        let cell = contentView?.superview     //Optional because no guarantee "superview" will be there, according to the code. Only you know.
        let index = tableView.indexPath(for: cell as! UITableViewCell)
        completed[(index?.row)!].doneYet = false
        let doneItem = completed.remove(at: (index?.row)!)
        notes.append(doneItem)
        CoreDataHelper.saveNote()
        tableView.reloadData()
    }
    
    var timeArray = [String]()
    
    override func viewDidLoad() {       //Loads everything to memory
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {  //Runs everytime view is seen
        notes = CoreDataHelper.retrieveNotes()
        completed.removeAll()
        var removed = 0
        for x in 0..<notes.count {
            let index = x - removed
            if notes[index].doneYet == true {
                let saveIt = notes.remove(at: index)
                completed.append(saveIt)
                removed += 1
            }
        }
        
        /*
         timeArray: String = [notes.modificationTime]
         timeArray = [time]
         timeArray.sort(by:{$0 < $1})
         */
        notes.sort(by: {$0.modificationTime!.convertToString() > $1.modificationTime!.convertToString()})    //Multiple periods OK
        /*
         let sorted = d.sort { lhs,rhs in
         let l = lhs.1["start"] as? NSDate
         let r = rhs.1["start"] as? NSDate
         return l < r
         }
         //Convert Date to String
         // BEST: https://www.youtube.com/watch?v=tQVvRcF7Z7E&t=194s
         // https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html
         */
        /*
         //func orderTime(_ s1: String, _ s2: String) -> Bool {
         //return s1 > s2
         //let timer: String = cell.noteModificationTimeLabel.text
         //let notes.modificationTime;: String = Date() as NSDate
         //notes.sorted(by: orderTime)
         //notes.sorted { (Date() as NSDate) -> Bool in
         //    cell.noteModificationTimeLabel.text
         //}
         */
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
            
            //let cell = tableView.dequeueReusableCell(withIdentifier: "listCompletedNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
            
            // 1
            let row = indexPath.row
            
            // 2
            let note = notes[row]
            
            // 3
            cell.noteTitleLabel.text = note.title
            
            // 4
            cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString()
            
            cell.textDisplay.text = note.content
            
            cell.categoryLabel.text = note.category
            
            cell.dueDateLabel.text = note.dueDate
            
            return cell

        } else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCompletedNotesTableViewCell", for: indexPath) as! CompletedTableViewCell
            
            //let cell = tableView.dequeueReusableCell(withIdentifier: "listCompletedNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
            
            // 1
            let row = indexPath.row
            
            // 2
            let note = completed[row]
            
            // 3
            cell.completednoteTitleLabel.text = note.title
            
            // 4
            cell.completednoteModificationTimeLabel.text = note.modificationTime?.convertToString()
            
            cell.completedtextDisplay.text = note.content
            
            cell.completedcategoryLabel.text = note.category
            
            cell.completeddueDateLabel.text = note.dueDate
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    // 1
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return notes.count
        }
        if section == 1 {
            return completed.count
        }
        return 0
    }
    
    // 2

    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
    */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                // 3
                print("Transitioning to the Display Note View Controller")
            }
        }
    }
    */
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    */
    
    @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
        self.notes = CoreDataHelper.retrieveNotes()
    }
    
    // 1
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 2
        if editingStyle == .delete {
            // 3
            //notes.remove(at: indexPath.row)
            //1
            if indexPath.section == 0 {
                CoreDataHelper.delete(note: notes.remove(at: indexPath.row))
            } else if indexPath.section == 1 {
                CoreDataHelper.delete(note: completed.remove(at: indexPath.row))
            }
            
            //2
            notes = CoreDataHelper.retrieveNotes()
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            //
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
            }
            //
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                // 1
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                var note = notes[indexPath.row]
                if indexPath.section == 1 {
                    note = completed[indexPath.row]
                }
                // 3
                let displayNoteViewController = segue.destination as! DisplayNoteViewController
                // 4
                displayNoteViewController.note = note
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    
    
}
