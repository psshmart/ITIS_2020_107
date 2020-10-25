//
//  ContactViewController.swift
//  ContactsHomework
//
//  Created by Svetlana Safonova on 25.10.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contact: Contact?
    
    @IBOutlet weak var message: UIButton!
    @IBOutlet weak var call: UIButton!
    @IBOutlet weak var video: UIButton!
    @IBOutlet weak var mail: UIButton!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var pictureCont: UIView!
    
    @IBOutlet weak var namePicture: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pictureCont.layer.cornerRadius = 48
        pictureCont.clipsToBounds = true
        message.layer.cornerRadius = 5
        message.clipsToBounds = true
        call.layer.cornerRadius = 5
        call.clipsToBounds = true
        video.layer.cornerRadius = 5
        video.clipsToBounds = true
        mail.layer.cornerRadius = 5
        mail.clipsToBounds = true
        phoneView.layer.cornerRadius = 5
        phoneView.clipsToBounds = true
        
        if let currentContact = contact {
            
            nameLabel.text = currentContact.firstName + " " + currentContact.lastName
            phoneLabel.text = currentContact.phoneNumber
            namePicture.text = String(currentContact.firstName.first!) + String(currentContact.lastName.first!)
        }
        
        
    }
    
    
    
    


}
