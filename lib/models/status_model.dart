class Status {
  final String username;
  final String uid;
  final String profilePic;
  final String phoneNumber;
  final List<String> photoUrl;
  final String statusId;
  final DateTime createdAt;
  final List<String> whoCanSee;

  Status({
    required this.username,
    required this.uid,
    required this.profilePic,
    required this.photoUrl,
    required this.phoneNumber,
    required this.statusId,
    required this.createdAt,
    required this.whoCanSee,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'photoUrl': photoUrl,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'statusId': statusId,
      'createdAt': createdAt,
      'whoCanSee': whoCanSee,
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      username: map['username'] ?? "",
      uid: map['uid'] ?? "",
      profilePic: map['profilePic'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      createdAt: DateTime.fromMicrosecondsSinceEpoch(map["createdAt"]),
      statusId: map['statusId'],
      photoUrl: List<String>.from(map['photoUrl']),
      whoCanSee: List<String>.from(map['whoCanSee']),
    );
  }
}
