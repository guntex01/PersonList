//
//  Person.swift
//  PersonList
//
//  Created by guntex01 on 5/22/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import Foundation
import UIKit
struct Person {
    var name: String
    var phone: String
    var avatarImage: UIImage
}

func fakeData() -> [Person] {
    let person1 = Person.init(name: "Ninh", phone: "0988673208", avatarImage: UIImage(named: "ninh")!)
    let person2 = Person.init(name: "phương", phone: "012345678", avatarImage: UIImage(named: "phuong")!)
    let person3 = Person.init(name: "Định", phone: "0985432060", avatarImage: UIImage(named: "dinh")!)
    
    return [person1, person2, person3]
}
