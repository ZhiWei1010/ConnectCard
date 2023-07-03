import 'package:connectcard/models/Cards.dart';
import 'package:connectcard/models/Friends.dart';

// UserData class which stores the user's data
class FriendsData {
  final String uid;
  final List<Friends> listOfFriends;
  final List<Friends> listOfFriendRequestsSent;
  final List<Friends> listOfFriendRequestsRec;
  final List<Cards> listOfFriendsPhysicalCard;

  FriendsData(
      {required this.uid,
      required this.listOfFriends,
      required this.listOfFriendRequestsSent,
      required this.listOfFriendRequestsRec,
      required this.listOfFriendsPhysicalCard});
}
