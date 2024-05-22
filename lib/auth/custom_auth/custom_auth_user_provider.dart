import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ChattyAuthUser {
  ChattyAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ChattyAuthUser> chattyAuthUserSubject =
    BehaviorSubject.seeded(ChattyAuthUser(loggedIn: false));
Stream<ChattyAuthUser> chattyAuthUserStream() =>
    chattyAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
