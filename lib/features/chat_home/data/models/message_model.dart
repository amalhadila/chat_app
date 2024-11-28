class MessageModel {
 String? id;
  String? fromid;
  String? toid;
  String? messsage;
  String? messsagetime;
  String? type;
  String? read;
  

  MessageModel ({
 this.id,
 this.fromid,
 this.toid,
 this.messsage,
 this.messsagetime,
 this.read,
 this.type
   
});

factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      fromid: map['fromid'],
      toid: map['toid'],
      messsage: map['messsage'],
      messsagetime: map['messsagetime'],
      type: map['type'],
      read: map['read'],
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromid': fromid,
      'toid': toid,
      'messsage': messsage,
      'messsagetime': messsagetime,
      'type': type,
      'read': read,
     
    };
  }
}