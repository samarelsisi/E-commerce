import 'package:e_commerece_online_c13/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Al-Muti","email":"samar25@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZDA3YWUzODE0MWQ1NzI5ZmUwMmRlOSIsIm5hbWUiOiJBaG1lZCBBbC1NdXRpIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDE3MTYxOTYsImV4cCI6MTc0OTQ5MjE5Nn0.kHx6qiPW9L22bZZVv2Pxzfj7uzoMtsuEx-JmEWFxu98"

class RegisterResponseDm  extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.user,
      super.statusMsg,
      super.token,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg=json['statusMsg'];
    user = json['user'] !=null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }
}
class UserDM extends UserEntity{
  UserDM({
      super.name,
      super.email,
      super.role,});

  UserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}