import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ownername" field.
  String? _ownername;
  String get ownername => _ownername ?? '';
  bool hasOwnername() => _ownername != null;

  // "parkingname" field.
  String? _parkingname;
  String get parkingname => _parkingname ?? '';
  bool hasParkingname() => _parkingname != null;

  // "parkingcapacity" field.
  int? _parkingcapacity;
  int get parkingcapacity => _parkingcapacity ?? 0;
  bool hasParkingcapacity() => _parkingcapacity != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "dynamicpricese" field.
  bool? _dynamicpricese;
  bool get dynamicpricese => _dynamicpricese ?? false;
  bool hasDynamicpricese() => _dynamicpricese != null;

  // "currentavailbility" field.
  int? _currentavailbility;
  int get currentavailbility => _currentavailbility ?? 0;
  bool hasCurrentavailbility() => _currentavailbility != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _ownername = snapshotData['ownername'] as String?;
    _parkingname = snapshotData['parkingname'] as String?;
    _parkingcapacity = castToType<int>(snapshotData['parkingcapacity']);
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _status = snapshotData['status'] as bool?;
    _dynamicpricese = snapshotData['dynamicpricese'] as bool?;
    _currentavailbility = castToType<int>(snapshotData['currentavailbility']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  String? phoneNumber,
  LatLng? location,
  String? ownername,
  String? parkingname,
  int? parkingcapacity,
  String? displayName,
  DateTime? createdTime,
  bool? status,
  bool? dynamicpricese,
  int? currentavailbility,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'phone_number': phoneNumber,
      'location': location,
      'ownername': ownername,
      'parkingname': parkingname,
      'parkingcapacity': parkingcapacity,
      'display_name': displayName,
      'created_time': createdTime,
      'status': status,
      'dynamicpricese': dynamicpricese,
      'currentavailbility': currentavailbility,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.location == e2?.location &&
        e1?.ownername == e2?.ownername &&
        e1?.parkingname == e2?.parkingname &&
        e1?.parkingcapacity == e2?.parkingcapacity &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.dynamicpricese == e2?.dynamicpricese &&
        e1?.currentavailbility == e2?.currentavailbility;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.phoneNumber,
        e?.location,
        e?.ownername,
        e?.parkingname,
        e?.parkingcapacity,
        e?.displayName,
        e?.createdTime,
        e?.status,
        e?.dynamicpricese,
        e?.currentavailbility
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
