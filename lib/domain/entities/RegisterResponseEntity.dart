/// message : "success"
/// user : {"name":"Ahmed Al-Muti","email":"ahmedmuttii401231@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3Y2UwNmQ4ODE0MWQ1NzI5ZmM1ODYzZiIsIm5hbWUiOiJBaG1lZCBBbC1NdXRpIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDE1NTU0MTYsImV4cCI6MTc0OTMzMTQxNn0.nLEbTxMmFtBWV0spg0bMarLQfWp4mDFmHiYhtKLIiQg"

class RegisterResponseEntity{
  RegisterResponseEntity({
      this.message, 
      this.user,
      this.statusMsg,
      this.token,});
  String? message;
  UserEntity? user;
  String? statusMsg;
  String? token;
  // RegisterResponseEntity.fromJson(dynamic json) {
  //   message = json['message'];
  //   user = json['user'] != null ? User.fromJson(json['user']) : null;
  //   token = json['token'];
  // }
  //
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['message'] = message;
  //   if (user != null) {
  //     map['user'] = user?.toJson();
  //   }
  //   map['token'] = token;
  //   return map;
  // }

}

/// name : "Ahmed Al-Muti"
/// email : "ahmedmuttii401231@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});
  String? name;
  String? email;
  String? role;
  // User.fromJson(dynamic json) {
  //   name = json['name'];
  //   email = json['email'];
  //   role = json['role'];
  // }
  //
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['role'] = role;
  //   return map;
  // }

}