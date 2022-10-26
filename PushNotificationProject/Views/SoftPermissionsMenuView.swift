//
//  ContentView.swift
//  SoftPermissionsMenuView
//
//  Created by Jonathon Albert on 11/10/2022.
//

import SwiftUI

struct SoftPermissionsMenuView: View {

    @State var showingSoftPushPermission: Bool = false

    var body: some View {
        List {
            Section("Push Notifications") {
                Group {
                    Button("Show soft push notification view") {
                        UserManager.shared.loginAnonymously()
                        showingSoftPushPermission.toggle()
                    }
                    Button("Trigger push notification") {
                        UserManager.shared.triggerNotification()
                    }
                }
            }
        }
        .sheet(isPresented: $showingSoftPushPermission) {
            SoftPushNotificationView() {
                PushNotificationManager.shared.requestAuthorization {
                    showingSoftPushPermission.toggle()
                }
            } negativeAction: {
                showingSoftPushPermission.toggle()
            }
        }
    }
}

struct SoftPermissionsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SoftPermissionsMenuView()
    }
}
