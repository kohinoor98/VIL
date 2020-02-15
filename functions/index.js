const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp(functions.config().firebase);

var msgData;

exports.noticeTrigger = functions.firestore
  .document("RechargePlan/{NoticesID}")
  .onCreate((snapshot, context) => {
    msgData = snapshot.data();
    admin
      .firestore()
      .collection("Token")
      .get()
      .then(async snapshots => {
        var tokens = [];
        if (snapshots.empty) {
          console.log("No Devices");
        } else {
          for (var token of snapshots.docs) {
            if (token.data().pushToken !== null)
              tokens.push(token.data().pushToken);
          }

          var payload = {
            notification: {
              title: msgData.PalanId,
              body: msgData.Talktime,
              sound: "default"
            },
            data: {
              sendername: msgData.PalanId,
              message: msgData.Talktime
            }
          };

          try {
            const response = await admin
              .messaging()
              .sendToDevice(tokens, payload);
            console.log(tokens);
            console.log("All Notifications Sent!");
          } catch (err) {
            console.log(err);
          }
        }
        return null;
      })
      .catch(err);
  });
