
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sajhabackup/Chat/message.dart';
//import 'package:sajhabackup/utils/firebase.dart';

class ChatService{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<List<Map<String,dynamic>>> getUsersStream(){
return _firestore.collection('users').snapshots().map((snapshot) {
  return snapshot.docs.map((doc) {
    final user=doc.data();
    return user;
  }).toList();
});
  }
  Future<void> sendMessage(String receiverID, String message)async{
    final String currentUserId= _auth.currentUser!.uid;
    final String currentUserEmail= _auth.currentUser!.email!;
    final Timestamp timestamp=Timestamp.now();
    Message newMessage=Message(senderId: currentUserId, senderEmail: currentUserEmail, receiverId :receiverID , message: message, timestamp: timestamp);
    List<String> ids=[currentUserId,receiverID];
    ids.sort();
    String chatRoomID=ids.join("_");
    await _firestore.collection('chat_rooms')
    .doc(chatRoomID)
    .collection('messages')
    .add(newMessage.toMap());
  }
  Stream<QuerySnapshot> getMessage(String userID, otherUserID){
    List<String> ids=[userID,otherUserID];
    ids.sort();
    String chatRoomID=ids.join('_');
    return _firestore
    .collection('chat_rooms')
    .doc(chatRoomID)
    .collection('messages')
    .orderBy('timestamp',descending: false)
    .snapshots();
  }
}