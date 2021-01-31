//
//  CardView.swift
//  MVVM
//
//  Created by Miguel Ferrer Fornali on 31/1/21.
//

import SwiftUI

struct CardView: View {
    
    var userDetails:User
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black, radius: 10, x: 1, y: 1)
            
            VStack(spacing: 10) {
                Text("\(self.userDetails.firstname) \(self.userDetails.lastname)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Text(self.userDetails.email)
                    .font(.title3)
                    .foregroundColor(.black)
            }.multilineTextAlignment(.center)
        }.padding()
        .frame(width: 400, height: 140, alignment: .center)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(userDetails: User(id:0, firstname:"", lastname:"", email:"", password:""))
    }
}
