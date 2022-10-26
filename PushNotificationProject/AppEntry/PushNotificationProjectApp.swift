//
//  PushNotificationProjectApp.swift
//  PushNotificationProject
//
//  Created by Jonathon Albert on 11/10/2022.
//

import SwiftUI

@main
struct PushNotificationProjectApp: App {

    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            SoftPermissionsMenuView()
        }
    }
}
