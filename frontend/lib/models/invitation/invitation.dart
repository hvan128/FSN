List<Invitation> invitationFromJson(dynamic str) =>
    List<Invitation>.from((str).map((x) => Invitation.fromJson(x)));

class Invitation {
  int? id;
  int? senderId;
  int? receiverId;
  int? fridgeId;
  DateTime? createdAt;
  int? active;

  Invitation(
      {this.id,
      this.senderId,
      this.receiverId,
      this.fridgeId,
      this.createdAt,
      this.active});

  Invitation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    fridgeId = json['fridgeId'];
    createdAt = DateTime.parse(json['createdAt']);
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['fridgeId'] = fridgeId;
    data['createdAt'] = createdAt!.toIso8601String();
    data['active'] = active;
    return data;
  }

  Invitation acceptInvitation() {
    return Invitation(
        id: id,
        senderId: senderId,
        receiverId: receiverId,
        fridgeId: fridgeId,
        createdAt: createdAt,
        active: 0);
  }
}
