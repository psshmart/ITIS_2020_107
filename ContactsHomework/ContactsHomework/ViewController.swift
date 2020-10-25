//
//  ViewController.swift
//  ContactsHomework
//
//  Created by Svetlana Safonova on 23.10.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        loadData()
        
    }
    
    
    private struct ContactsSectionData {
        let contacts: [Contact]
    }
    
    private var sectionsData: [ContactsSectionData]?
    
    var contacts = [
        Contact(name: "Cat", surname: "A", number: "+1(111)111-11-11"),
        Contact(name: "Sveta", surname: "Safonova", number: "+4(834)457-34-65"),
        Contact(name: "Igor", surname: "Mezin", number: "+7(906)666-66-66"),
        Contact(name: "Ruslan", surname: "Khanov", number: "+7(907)777-77-77"),
        Contact(name: "Daria", surname: "Egorova", number: "+7(908)888-88-88"),
        Contact(name: "Denis", surname: "Matveev", number: "+7(894)645-67-23"),
        Contact(name: "Danil", surname: "Vasiliev", number: "+7(563)732-23-87"),
        Contact(name: "Ilshat", surname: "Mukhamedyarov", number: "+7(765)738-84-34"),
        Contact(name: "Aygul", surname: "Usmanova", number: "+7(606)373-32-23"),
        Contact(name: "Ildar", surname: "Zalyaliev", number: "+7(569)436-34-78"),
        Contact(name: "Alexey", surname: "Shandrenko", number: "+7(543)324-78-08"),
        Contact(name: "Alsu", surname: "Mukhametshina", number: "+7(657)325-89-45")
    ]
    
    func loadData() {
        let sorted = contacts.sorted{$0.firstName < $1.firstName}
        var contactsArray = [Contact]()
        sectionsData = []
        for i in 0...contacts.count-2 {
            if sorted[i].firstName.first! == sorted[i+1].firstName.first! {
                contactsArray.append(sorted[i])
            }
            else {
                contactsArray.append(sorted[i])
                sectionsData?.append(ContactsSectionData.init(contacts: contactsArray))
                contactsArray = []
            }
        }
        if sorted[sorted.count-1].lastName.first != sorted[sorted.count-2].lastName.first {
            contactsArray = []
            contactsArray.append(sorted[sorted.count-1])
            sectionsData?.append(ContactsSectionData.init(contacts: contactsArray))
        }
        else {
            contactsArray = sectionsData?.last?.contacts as! [Contact]
            contactsArray.append(sorted[sorted.count-1])
            sectionsData?.popLast()
            sectionsData?.append(ContactsSectionData.init(contacts: contactsArray))
        }
       
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contactsData = sectionsData?[section] else {return 0}
        return contactsData.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = sectionsData?[indexPath.section]
        else { fatalError("Attempt to get data while it is not loaded") }
        
        let cellId = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
       
        cell.textLabel?.text =
            cellData.contacts[indexPath.row].firstName + " " + cellData.contacts[indexPath.row].lastName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let contactsData = sectionsData?[section] else {return "0"}
        return String(contactsData.contacts[0].firstName.first!)
        
    }
    
   @IBOutlet weak var tableView: UITableView!
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contact" {
            guard let indexPath = tableView.indexPathForSelectedRow else {fatalError()}
            
            guard let cellData = sectionsData?[indexPath.section]
            else { fatalError("Attempt to get data while it is not loaded") }
            
            let destination = segue.destination as! ContactViewController
            
            destination.contact = cellData.contacts[indexPath.row]

            
        }
    }
    

}

