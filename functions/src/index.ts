import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const db = admin.firestore();

exports.userTriggeredNotifications = functions
    .region("europe-west2")
    .firestore
    .document("trigger/{triggerId}")
    .onCreate(async (snapshot, context) => {
      const triggerSnapshot = snapshot.data();
      const triggeredUserId = triggerSnapshot.userId;
      const userReference = db.collection("user").doc(`${triggeredUserId}`);
      const userWhoTriggered = await userReference.get();

      if (!userWhoTriggered.exists) {
        functions.logger.error("No such document", triggeredUserId);
        return;
      } else {
        const userData = userWhoTriggered.data();
        const token = userData?.notificationToken;

        // Notification payload
        const payload = {
          notification: {
            title: "New trigger!",
            body: "You triggered a notification to yourself",
          },
        };

        // Send payload to device token for userWhoTriggered
        const response = await admin.messaging().sendToDevice(token, payload);
        response.results.forEach((result) => {
          const error = result.error;
          if (error) {
            functions.logger.error("Failed sending notification", token, error);
          }
        });
        return;
      }
    });
