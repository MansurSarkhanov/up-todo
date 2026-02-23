import 'dart:io';

abstract class UserEvent {}

class LoadUser extends UserEvent {
  final String uid;
  LoadUser(this.uid);
}

class UpdateUserOnlineStatus extends UserEvent {
  final bool isOnline;
  UpdateUserOnlineStatus(this.isOnline);
}

class UpdateUserProfile extends UserEvent {
  final String? username;
  final File? image;

  UpdateUserProfile({this.username, this.image});
}
