//
//  User.swift
//  MVVMexample
//
//  Created by Miguel Ferrer Fornali on 30/1/21.
//

import Foundation

//El modelo es donde estarán las estucturas de datos donde estos se almacenen

struct User: Codable, Identifiable, Hashable {
    var id:Int
    var firstname:String
    var lastname:String
    var email:String
    var password:String
}
