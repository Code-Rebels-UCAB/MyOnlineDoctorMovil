abstract class AbstractNotificationView<S,C,D,E> {
  void update(S splitt, C title, D context, E navigatorKey);
  void viewNotification(S splitt, D context, E navigatorKey);
}