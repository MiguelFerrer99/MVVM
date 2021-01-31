//
//  ContentView.swift
//  MVVM
//
//  Created by Miguel Ferrer Fornali on 31/1/21.
//

import SwiftUI

//La Vista es la parte de la aplicación que viualizará el usuario

struct ContentView: View {
    
    @ObservedObject var users = FetchUsers()
    @State var showUser = false
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    //Card View de cada usuario
                    ForEach(self.users.users) { user in
                        NavigationLink(
                            destination: UserView(userDetails: user),
                            isActive: self.$showUser,
                            label: {
                                CardView(userDetails: user)
                            })
                    }
                }
            }.onAppear {
                //Fetching users...
                self.users.fetchUsers()
            }
            .navigationBarTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
