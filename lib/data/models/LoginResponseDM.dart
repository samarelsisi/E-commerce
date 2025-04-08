import 'package:e_commerece_online_c13/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"samar","email":"samar2500@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTYwOTRkZTE2MmFiZWVmY2VkNDg4MiIsIm5hbWUiOiJzYW1hciIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQzMTI4OTQ4LCJleHAiOjE3NTA5MDQ5NDh9.G8W3mqNJp9OnhFBRDIx0vrUF9zlMe81e2YVyfOr3N3g"

class LoginResponseDm  extends LoginResponseEntity{
  String ? statusMsg;
  LoginResponseDm({
      super.message,
      this.statusMsg,
      super.user,
      super.token,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? LoginUserDM.fromJson(json['user']) : null;
    token = json['token'];
  }




}

/// name : "samar"
/// email : "samar2500@gmail.com"
/// role : "user"

class LoginUserDM  extends LoginUserEntity{
  LoginUserDM({
      super.name,
      super.email,
      this.role,});

  LoginUserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

}