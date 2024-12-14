class RoomModel {
  String? id;
  String? name;
  List? members;
  String? createdAt;
  String? lastmessage;
  String? lastmessagetime;
  

  RoomModel ({
 this.id,
 this.name,
 this.members,
 this.createdAt,
 this.lastmessage,
 this.lastmessagetime,
   
});

factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'],
       name: map['name'],
      members: map['members'],
      createdAt: map['createdAt'],
      lastmessage: map['lastmessage'],
      lastmessagetime: map['lastmessagetime'],
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'members': members,
      'createdAt': createdAt,
      'lastmessage': lastmessage,
      'lastmessagetime': lastmessagetime,
     
    };
  }
}