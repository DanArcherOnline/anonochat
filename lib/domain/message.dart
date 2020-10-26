import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  static const String _CONTENT = 'content';
  static const String _DISPLAY_NAME = 'display_name';
  static const String _CREATED_AT = 'created_at';

  DocumentReference reference;
  final String content;
  final String displayName;

  Message(this.content, this.displayName);

  Message.fromJson(Map<String, dynamic> map, {this.reference})
      : displayName = map[_DISPLAY_NAME],
        content = map[_CONTENT];

  Message.fromFirestore(DocumentSnapshot snapshot)
      : this.fromJson(
          snapshot.data(),
          reference: snapshot.reference,
        );

  Map<String, dynamic> toSnapshot() => {
        _CONTENT: content,
        _DISPLAY_NAME: displayName,
        _CREATED_AT: FieldValue.serverTimestamp(),
      };
}
