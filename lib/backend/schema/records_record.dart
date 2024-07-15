import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordsRecord extends FirestoreRecord {
  RecordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "in_time" field.
  DateTime? _inTime;
  DateTime? get inTime => _inTime;
  bool hasInTime() => _inTime != null;

  // "out_time" field.
  DateTime? _outTime;
  DateTime? get outTime => _outTime;
  bool hasOutTime() => _outTime != null;

  // "vechicel_no" field.
  String? _vechicelNo;
  String get vechicelNo => _vechicelNo ?? '';
  bool hasVechicelNo() => _vechicelNo != null;

  // "totalfaire" field.
  int? _totalfaire;
  int get totalfaire => _totalfaire ?? 0;
  bool hasTotalfaire() => _totalfaire != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _inTime = snapshotData['in_time'] as DateTime?;
    _outTime = snapshotData['out_time'] as DateTime?;
    _vechicelNo = snapshotData['vechicel_no'] as String?;
    _totalfaire = castToType<int>(snapshotData['totalfaire']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('records')
          : FirebaseFirestore.instance.collectionGroup('records');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('records').doc(id);

  static Stream<RecordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecordsRecord.fromSnapshot(s));

  static Future<RecordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecordsRecord.fromSnapshot(s));

  static RecordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecordsRecordData({
  DateTime? inTime,
  DateTime? outTime,
  String? vechicelNo,
  int? totalfaire,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'in_time': inTime,
      'out_time': outTime,
      'vechicel_no': vechicelNo,
      'totalfaire': totalfaire,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecordsRecordDocumentEquality implements Equality<RecordsRecord> {
  const RecordsRecordDocumentEquality();

  @override
  bool equals(RecordsRecord? e1, RecordsRecord? e2) {
    return e1?.inTime == e2?.inTime &&
        e1?.outTime == e2?.outTime &&
        e1?.vechicelNo == e2?.vechicelNo &&
        e1?.totalfaire == e2?.totalfaire;
  }

  @override
  int hash(RecordsRecord? e) => const ListEquality()
      .hash([e?.inTime, e?.outTime, e?.vechicelNo, e?.totalfaire]);

  @override
  bool isValidKey(Object? o) => o is RecordsRecord;
}
