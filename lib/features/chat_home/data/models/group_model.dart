class GroupModel {
  String? id;
  String? name;
  String? image;
  List? members;
  List? admins;
  String? createdAt;
  String? lastmessage;
  String? lastmessagetime;
  

  GroupModel ({
 this.id,
 this.name,
 this.image,
 this.members,
 this.admins,
 this.createdAt,
 this.lastmessage,
 this.lastmessagetime,
   
});

factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['id'],
       name: map['name'],
       image: map['image'],
      members: map['members'],
       admins: map['admins'],
      createdAt: map['createdAt'],
      lastmessage: map['lastmessage'],
      lastmessagetime: map['lastmessagetime'],
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image':image,
      'members': members,
      'admins':admins,
      'createdAt': createdAt,
      'lastmessage': lastmessage,
      'lastmessagetime': lastmessagetime,
     
    };
  }
}