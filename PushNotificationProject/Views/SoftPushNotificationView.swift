//
//  SoftPushNotificationView.swift
//  PushNotificationProject
//
//  Created by Jonathon Albert on 13/10/2022.
//

import SwiftUI

struct SoftPushNotificationView: View {

    var positiveAction: () -> Void
    var negativeAction: () -> Void

    var body: some View {
        GeometryReader { geoProxy in
            ZStack {
                Color.orange.opacity(0.2)
                    .ignoresSafeArea()

                VStack(spacing: 32.0) {
                    Text("Get notified when you have new followers,\n new recommendations \n and 🥰 for you")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16.0)

                    Button("Allow notifications") {
                        positiveAction()
                    }
                    .frame(height: 60.0)
                    .frame(width: geoProxy.size.width * 0.8)
                    .background(.black)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(12.0)

                    Button("Don't allow notifications") {
                        negativeAction()
                    }
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct SoftPushNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SoftPushNotificationView(positiveAction: {}, negativeAction: {})
        }
    }
}
