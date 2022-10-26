//
//  FCMTokenManager.swift
//  PushNotificationProject
//
//  Created by Jonathon Albert on 12/10/2022.
//

import Foundation

class FCMTokenManager {

    static let shared = FCMTokenManager()

    private enum UserDefaultKey: String {
        case fcmToken
    }

    var currentToken: String? {
        get {
            UserDefaults.standard.string(forKey: UserDefaultKey.fcmToken.rawValue)
        }

        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultKey.fcmToken.rawValue)
        }
    }
}
