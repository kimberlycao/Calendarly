import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');
}
