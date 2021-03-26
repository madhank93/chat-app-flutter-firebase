import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseFireStoreDB {
  static final _fireStoreDB = FirebaseFirestore.instance;
  static get instance => _fireStoreDB;

  CollectionReference getCollectionReference() {
    throw new Exception(
        "Collection reference should be implemented by subclass: ${this.runtimeType}");
  }

  String getID() {
    throw new Exception(
        "ID should be implemented by subclass: ${this.runtimeType}");
  }

  add(Map<String, dynamic> data) {
    String id = getID();
    data['uuid'] = id;
    data['createdAt'] = FieldValue.serverTimestamp();
    getCollectionReference().doc(id).set(data);
  }
}
