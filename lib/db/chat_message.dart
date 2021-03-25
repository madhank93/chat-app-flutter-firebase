import 'package:chat_app/services/firebase_firestore_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage extends FireBaseFireStoreDB {
  @override
  CollectionReference getCollectionReference() {
    return FireBaseFireStoreDB.instance.collection("messages");
  }

  @override
  String getID() {
    return getCollectionReference().doc().id;
  }

  Stream<QuerySnapshot> getStreamOfMessages() {
    return getCollectionReference().orderBy('message').snapshots();
  }
}
