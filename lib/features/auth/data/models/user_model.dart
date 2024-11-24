class UserModel {
  String? id;
  String? name;
  String? email;
  String? createdAt;
  String? lastActivate;
  String? token;
  bool? active;
  String? about;
  String? image;
  String? phone;

  UserModel ({
 this.id,
 this.name,
 this.email,
 this.createdAt,
 this.lastActivate,
 this.token,
  this.active,
 this.about,
 this.image,
  this.phone,  
});

factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      createdAt: map['createdAt'],
      lastActivate: map['lastActivate'],
      token: map['token'],
      active: map['active'],
      about: map['about'],
      image: map['image'],
      phone: map['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'lastActivate': lastActivate,
      'token': token,
      'active': active,
      'about': about,
      'image': image,
      'phone': phone,
    };
  }
}