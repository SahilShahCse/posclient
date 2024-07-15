import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveTransactionsRecord extends FirestoreRecord {
  ActiveTransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vechica_no" field.
  String? _vechicaNo;
  String get vechicaNo => _vechicaNo ?? '';
  bool hasVechicaNo() => _vechicaNo != null;

  // "in_time" field.
  DateTime? _inTime;
  DateTime? get inTime => _inTime;
  bool hasInTime() => _inTime != null;

  // "carduid" field.
  String? _carduid;
  String get carduid => _carduid ?? '';
  bool hasCarduid() => _carduid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vechicaNo = snapshotData['vechica_no'] as String?;
    _inTime = snapshotData['in_time'] as DateTime?;
    _carduid = snapshotData['carduid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('active_transactions')
          : FirebaseFirestore.instance.collectionGroup('active_transactions');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('active_transactions').doc(id);

  static Stream<ActiveTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActiveTransactionsRecord.fromSnapshot(s));

  static Future<ActiveTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ActiveTransactionsRecord.fromSnapshot(s));

  static ActiveTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActiveTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActiveTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActiveTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActiveTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActiveTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActiveTransactionsRecordData({
  String? vechicaNo,
  DateTime? inTime,
  String? carduid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vechica_no': vechicaNo,
      'in_time': inTime,
      'carduid': carduid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActiveTransactionsRecordDocumentEquality
    implements Equality<ActiveTransactionsRecord> {
  const ActiveTransactionsRecordDocumentEquality();

  @override
  bool equals(ActiveTransactionsRecord? e1, ActiveTransactionsRecord? e2) {
    return e1?.vechicaNo == e2?.vechicaNo &&
        e1?.inTime == e2?.inTime &&
        e1?.carduid == e2?.carduid;
  }

  @override
  int hash(ActiveTransactionsRecord? e) =>
      const ListEquality().hash([e?.vechicaNo, e?.inTime, e?.carduid]);

  @override
  bool isValidKey(Object? o) => o is ActiveTransactionsRecord;
}
