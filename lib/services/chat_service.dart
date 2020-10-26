import 'dart:async';

import 'package:ananochat/domain/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {
  static const String _MESSAGES = 'messages';
  static const String _CREATED_AT = 'created_at';

  final Stream<QuerySnapshot> _snapshots;
  final CollectionReference _collection;

  ChatService()
      : _collection = FirebaseFirestore.instance.collection(_MESSAGES),
        _snapshots = FirebaseFirestore.instance
            .collection(_MESSAGES)
            .orderBy(_CREATED_AT)
            .snapshots();

  void addMessage(Message message) async {
    if (message.content.isNotEmpty) {
      try {
        await _collection.doc().set(message.toSnapshot());
        notifyListeners();
      } on FirebaseException catch (e) {
        print('Error with setting data in FireStore: ${e.code}');
        print('↑\n${e.message}');
      }
    }
  }

  Stream<List<Message>> get messages =>
      _snapshots.map((snapshot) => snapshot.docs.reversed
          .map((document) => Message.fromFirestore(document))
          .toList());
}
