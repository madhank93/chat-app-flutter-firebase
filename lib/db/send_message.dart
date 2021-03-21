import 'package:chat_app/services/firebase_firestore_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SendMessage extends FireBaseFireStoreDB {
  @override
  CollectionReference getCollectionReference() {
    return FireBaseFireStoreDB.instance.collection("messages");
  }

  @override
  String getID() {
    return getCollectionReference().doc().id;
  }
}
