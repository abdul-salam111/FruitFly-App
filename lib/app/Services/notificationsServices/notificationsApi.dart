import 'dart:convert';
import 'package:http/http.dart' as http;

// Future sendNotifications(String tokens, String title, String body) async {
//   var data = {
//     'to': tokens,
//     'notification': {'title': title, 'body': body, "sound": "default"},
//     "priority": "high",
//     'android': {
//       'notification': {
//         'notification_count': 8,
//       },
//     },
//     'data': {

//     }
//   };
//   await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
//       body: jsonEncode(data),
//       headers: {
//         'content-type': "application/json; charset=UTF-8",
//         "Authorization":
//             "key=AAAAQ6c5jn4:APA91bEuOvYlB8sMFsAZYNvOEuKr7YGv8YPiir74klhsdPsEBta4cx09KR5TcxcyVCpl1shViaXGd19SeelMPprXmFYjOxVdDneleaNrdMgpbtjyIEbkvXzxbMiaqMri4SgEjclA5UDq"
//       });
// }

import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationsServices {
 static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "fruitfly-c617a",
      "private_key_id": "3600b00856ef28e6c241a994130c36269737c801",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD8mibxbSAFIRM8\nojYrlwbr4kgh5KQe81vbZnzjbl7SsVyzR0ZhRwAhQkgwyqH6M1YphEvynW8A3pz8\nGKUhM+H6l1RfnjKDMGsWwTr86p7GaDQKMUnLMz8OzILQEC4hVMBi594UUQhgnQnz\nNthFUEWOwO9uEHNU3iuCDGyLcktJ0+8lAFQ+onmSy/gJ6lzlO5Rvmjb6F86UZ/jk\nXR3bO5MHc1DGYF/fR7mlid6vVAlRqULzAjv9Q/w2f7hq6C8Mu5u0AGYjXVXGkZ6Q\nWKmu2lTWoA6GDHr6ztxINkBhF2CEX9XMEa55LprchD+CtydLvDNOYkNEk6iUQ+pZ\n9sv0ALqLAgMBAAECggEAQ55iUVt0aFsXwrHrjVSi8i8DPyts8aoUi1FOmjUX5g+7\ncHRidzTh6IVNPN5paMgoRvnWuM4DAnkVDfjs70vrsMCkwenfvLWP3SoBx+VodlU7\npQTXq7D+rs/5Log+SQbebzuBe+/LLc2r9bLXRwq7bADitxRpQy0r+WapAdUpKUwt\nwVqYFKEmJSim9sIp8eZ7hZCbyMbrYP1ZfDWvHCjdSMjNS64sVBPxhQXv/MiMxOyD\nu8OkNYj9Zvx9xW+7aIDIIbOtFdPTwFvYWvHTNbcJRzVR7jAhpfLFA89JT8WYOeT0\nhMsvoW2Aa7eg3BqoIUu7uJnk+jiEUeSu6/JFmaIzlQKBgQD+apS1ZprhdeTMHdxR\nAoyMvVmOIy6aolr+39obccD3ppRsHhdrbBWZ/acI8W/qd7JKTlTFIbIAV0nlemHK\n+kE3UR1wu8uxRTpxsLtiSfQpq4pBgoX/jGoeWPJzUg4cNmKRA2xHx0tPje798/Lz\n/rFxq7MUzRnsGoMCwceLu0/qHwKBgQD+LK4nr+tcg3IwzBaswANymUphVOP9vmXd\nsW9xm42DGDqcpuRRp5Xh6pDzOOdUfju/8NnprpJuCtt8kZv7g9ItbLPjD97Xjb4Z\nVIZ2KXBuRlPaQZQC+HtNWpgXdsnvrx7NlTwERKXieuCSt3bOhRmvHspFXh08LJMn\nOOib3qi6FQKBgQCUvWUBhOIpzA4ek5qZtf7LzWvNIJ5/g0nl1qOiBehGIRqG9zTD\n9eXPKK9+GAFRN/eBX7hJpAB4GJA4XEtOKu7z0zV+EhztH8cibquutAPOVN64nAGR\nPNtRsLjWWPOs5NLNaw3kDQznjthZmkTBB3dgOHyzPZHZKkrL0tTByZnYCwKBgHnu\nVzFkvASqbgoorav7hOvhy4O7pI+iWd2q8+pNE+rSobNqgFcHjOhOjXCQWLD4yZL/\naJooi8hMXxR4CZrzls0Bu53ujBldvtcJ7GMc5/mOtUUbdnSiXQwzrIh9DMx1dtJq\nh9sIT4fBKKBZcJ4LzdFrdN8oEeA/Beyn6TZ07v4tAoGALKXYLfMUhnaYgwBS4avb\n29r2IumFh1WWaCru5VpvfxbIpXsKUT18dclJ964hyxn29OSCePZF74zo9FsZarL8\nt67hccVjYiVJNPNg8xMQc1LDeE377GdQnurp68mQPK2eOTVyWX69fOPmm5Jyebp2\nzK5iw9v/lYcWBGtSmEio4Xg=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-yyhoj@fruitfly-c617a.iam.gserviceaccount.com",
      "client_id": "109068325344276608001",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-yyhoj%40fruitfly-c617a.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    //get access token
    auth.AccessCredentials accessCredentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();
    return accessCredentials.accessToken.data;
  }

  static sendNotificationToSelectedDriver(String deviceToken, BuildContext context,
      String title, String body) async {
    final String serverKey = await getAccessToken();
    String firebaseMessagingApi =
        "https://fcm.googleapis.com/v1/projects/fruitfly-c617a/messages:send";

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': title,
          'body': body,
        },
        'data': {'hello': 'hello'}
      }
    };
    final http.Response response =
        await http.post(Uri.parse(firebaseMessagingApi),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $serverKey',
            },
            body: jsonEncode(message));
    if (response.statusCode == 200) {
      print("notifiations send successfully");
    }
  }
}
