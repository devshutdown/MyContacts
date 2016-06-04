//
//  Contact+CoreDataProperties.swift
//  MyContacts
//
//  Created by Chuck Konkol on 6/4/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var email: String?
    @NSManaged var fullname: String?
    @NSManaged var phone: String?

}
