import 'package:addvisor/Features/utilities.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createNotification() async {
  await AwesomeNotifications.createNotification(
    content: NotificationContent(
      id: createUniqueID(),
      channelKey: 'basic_channel',
      title: '',
      body: '',
      bigPicture: '',
      notificationLayout: NotificationLayout.BigPicture(),
    ),
  );
}
