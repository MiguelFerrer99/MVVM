//
//  ContentView.swift
//  MVVM
//
//  Created by Miguel Ferrer Fornali on 31/1/21.
//

import SwiftUI

//La Vista es la parte de la aplicación que viualizará el usuario

struct ContentView: View {
    
    @ObservedObject var fetchedUsers = FetchUsers()
    @State private var searchText = ""
    @State private var showUserView = false
    @State private var heightView:CGFloat = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SearchBar(text: self.$searchText)
                    ForEach(self.fetchedUsers.users.filter {
                        searchText.isEmpty ? true : $0.firstname.lowercased().prefix(searchText.count).localizedStandardContains(searchText)
                    }, id: \.self) { user in
                        NavigationLink(
                            destination: UserView(userDetails: user),
                            isActive: self.$showUserView,
                            label: {
                                CardView(userDetails: user)
                        })
                    }
                }
            }
            .navigationBarTitle("Users")
        }.onAppear  {
            self.fetchedUsers.fetchUsers()
            //When action notification button is pressed...
            NotificationCenter.default.addObserver(forName: NSNotification.Name("goUserView"), object: nil, queue: .main) { (_) in
                //codigo para hacer cuando se pulse el boton ir a UserView
                showUserView.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
