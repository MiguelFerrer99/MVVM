//
//  UserView.swift
//  MVVM
//
//  Created by Miguel Ferrer Fornali on 31/1/21.
//

import SwiftUI

struct UserView: View {
    
    var userDetails:User
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("\(userDetails.firstname) \(userDetails.lastname)")
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                Text(userDetails.email)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer()
            .navigationBarTitle(userDetails.firstname)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userDetails: User(id: 0, firstname: "", lastname: "", email: "", password: ""))
    }
}
