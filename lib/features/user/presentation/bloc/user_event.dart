import 'dart:io';

abstract class UserEvent {}

class LoadUser extends UserEvent {
  LoadUser(this.uid);
  final String uid;
}

class UpdateUserOnlineStatus extends UserEvent {
  UpdateUserOnlineStatus({required this.isOnline});
  final bool isOnline;
}

class UpdateUserProfile extends UserEvent {
  UpdateUserProfile({this.username, this.image});
  final String? username;
  final File? image;
}
