/// message : "success"
/// user : {"name":"samar","email":"samar2500@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZTYwOTRkZTE2MmFiZWVmY2VkNDg4MiIsIm5hbWUiOiJzYW1hciIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQzMTI4OTQ4LCJleHAiOjE3NTA5MDQ5NDh9.G8W3mqNJp9OnhFBRDIx0vrUF9zlMe81e2YVyfOr3N3g"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  LoginUserEntity? user;
  String? token;



}

/// name : "samar"
/// email : "samar2500@gmail.com"
/// role : "user"

class LoginUserEntity {
  LoginUserEntity({
      this.name, 
      this.email, 
     });
  String? name;
  String? email;




}