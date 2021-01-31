//
//  FetchUsers.swift
//  MVVMexample
//
//  Created by Miguel Ferrer Fornali on 30/1/21.
//

import Foundation
import SwiftUI

//VistaModelo es la parte en que realizamos funciones que puedan devolver una vista directamente a la parte "Vista"

class FetchUsers: ObservableObject {
    
    @Published var users:[User] = []
    let url = "https://raw.githubusercontent.com/MiguelFerrer99/MVVMexample/main/users.json"
    let url2 = "https://jsonplaceholder.typicode.com/users"
    
    func fetchUsers() {
        
        guard let url = URL( string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _ ,_) in
            
            let usersDecoder = try! JSONDecoder().decode([User].self, from: data!)
            
            DispatchQueue.main.async {
                self.users = usersDecoder
            }
            
        }.resume()
    }
}
