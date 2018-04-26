//
//  ViewController.swift
//  FamSchedV2
//
//  Created by Hongbo Niu on 2018-04-26.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var schedules:Results<ScheduleModel>?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let nibName = UINib(nibName: "SchedTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "Cell")
        load()
        
        
    }
    
    //    MARK:- TableView DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchedTableViewCell
        if let sched = schedules?[indexPath.row] {
        cell.ScheduleCellInit(famName: sched.memberName, dates: sched.whatDate, whatThing: sched.famThings)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules? .count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    @IBAction func segmentSchedule(_ sender: UISegmentedControl) {
    }
    

    @IBAction func addNewSchedule(_ sender: UIBarButtonItem) {
        var nameTextField = UITextField()
        var timeTextField = UITextField()
        var thingsTextField = UITextField()
 
        
        let alert = UIAlertController(title: "Add New Schedules", message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (OKAction) in
//            what will happen when you press ok button.
            let schedules = ScheduleModel()
            schedules.memberName.append(nameTextField.text!)
            schedules.whatDate.append(timeTextField.text!)
            schedules.famThings.append(thingsTextField.text!)
           
            
              self.save(schedule: schedules)
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (name) in
            name.placeholder = "    Which baby?"
            nameTextField = name
        }
        alert.addTextField { (time) in
            time.placeholder = "    What time?"
           timeTextField = time
        }
        alert.addTextField { (things) in
            things.placeholder = "    Anythings?"
            thingsTextField = things
        }
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    //    MARK: - Manipulate Save and Load Data Function
    
    //    TODO: Save Data
    func save(schedule:ScheduleModel){
        do{
        try realm.write {
            realm.add(schedule)
        }
        }catch{
            print("saving problem!")
        }
        tableView.reloadData()
    }
    
    
    //    TODO: Load Data
    func load(){
        schedules = realm.objects(ScheduleModel.self)
        tableView.reloadData()
    }
}

