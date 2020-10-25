//
//  Contact.swift
//  ContactsHomework
//
//  Created by Svetlana Safonova on 24.10.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import Foundation

class Contact {
    
    var firstName: String
    var lastName: String
    var phoneNumber: String
       
    init(name: String, surname: String, number: String)
    {
        firstName = name
        lastName = surname
        phoneNumber = number
    }
}
