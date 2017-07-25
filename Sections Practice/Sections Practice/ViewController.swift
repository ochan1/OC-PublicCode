//
//  ViewController.swift
//  Sections Practice
//
//  Created by Oscar Chan on 6/29/17.
//  Copyright © 2017 Oscar Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionTitles: [String] = ["In Progress", "Completed", "Others"]
    
    let s1Data: [String] = ["Row 1", "Row 2", "Row 3"]
    let s2Data: [String] = ["Row 1", "Row 2", "Row 3"]
    let s3Data: [String] = ["Row 1", "Row 2", "Row 3"]
    var sectionData: [Int: [String]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sectionData = [0:s1Data, 1:s2Data, 2:s3Data]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    */
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
//        let label = UILabel()
//        label.text = sectionTitles[section]
//        label.frame = CGRect(x: 45, y: 5, width: 100, height: 35)
//        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell");
        }
        cell!.textLabel?.text = sectionData[indexPath.section]![indexPath.row]
        return cell!
    }
}

