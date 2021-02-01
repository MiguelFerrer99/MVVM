//
//  UserView.swift
//  MVVM
//
//  Created by Miguel Ferrer Fornali on 31/1/21.
//

import SwiftUI
import UserNotifications

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
                Button {
                    localNotification()
                } label: {
                    Text("Notify me")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .font(.title3)
                }
            }
            Spacer()
            .navigationBarTitle(userDetails.firstname)
        }
    }
    
    func localNotification() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
            
        }
        
        //Content
        let content = UNMutableNotificationContent()
        content.title = "MVVM notification"
        content.body = "\(userDetails.firstname) \(userDetails.lastname) has notified"
        content.sound = UNNotificationSound.defaultCritical
        content.badge = 1
        
        //Image (en el caso que queramos añadir una imagen)
        if let path = Bundle.main.path(forResource: "swift", ofType: "png", inDirectory: "Assets.xcasssets") {
            let url = URL(fileURLWithPath: path)
            do {
                let image = try UNNotificationAttachment(identifier: "imageID", url: url, options: nil)
                content.attachments = [image]
            } catch {
                print("No cargó la imagen")
            }
        }
        
        //Buttons
        let button = UNNotificationAction(identifier: "buttonID", title: "Open \(userDetails.firstname) View", options: .foreground)
        let cancel = UNNotificationAction(identifier: "cancelID", title: "Cancel", options: .destructive)
        let category = UNNotificationCategory(identifier: "categoryID", actions: [button,cancel], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "categoryID"
        
        //Trigger (Disparador)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notificationRequestID", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userDetails: User(id: 0, firstname: "", lastname: "", email: "", password: ""))
    }
}
