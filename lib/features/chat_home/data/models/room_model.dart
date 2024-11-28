class RoomModel {
  String? id;
  List? members;
  String? createdAt;
  String? lastmessage;
  String? lastmessagetime;
  

  RoomModel ({
 this.id,
 this.members,
 this.createdAt,
 this.lastmessage,
 this.lastmessagetime,
   
});

factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'],
      members: map['members'],
      createdAt: map['createdAt'],
      lastmessage: map['lastmessage'],
      lastmessagetime: map['lastmessagetime'],
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'members': members,
      'createdAt': createdAt,
      'lastmessage': lastmessage,
      'lastmessagetime': lastmessagetime,
     
    };
  }
}