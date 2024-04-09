import 'dart:convert';
/// username : "six"
/// nickname : "luke"
/// userId : "123456789"
/// avatarUrl : "https://c-ssl.dtstatic.com/uploads/blog/202201/23/20220123222213_2899a.thumb.400_0.jpeg"
/// token : "c7c53812312312312312312"
/// purchasedBooksCount : 10
/// followersCount : 100
/// readingCount : 50
/// notesCount : 20
/// booksReadCount : 30
/// likesCOunt : 50
/// booklistsCount : 5

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.username, 
      this.nickname, 
      this.userId, 
      this.avatarUrl, 
      this.token, 
      this.purchasedBooksCount, 
      this.followersCount, 
      this.readingCount, 
      this.notesCount, 
      this.booksReadCount, 
      this.likesCOunt, 
      this.booklistsCount,});

  User.fromJson(dynamic json) {
    username = json['username'];
    nickname = json['nickname'];
    userId = json['userId'];
    avatarUrl = json['avatarUrl'];
    token = json['token'];
    purchasedBooksCount = json['purchasedBooksCount'];
    followersCount = json['followersCount'];
    readingCount = json['readingCount'];
    notesCount = json['notesCount'];
    booksReadCount = json['booksReadCount'];
    likesCOunt = json['likesCOunt'];
    booklistsCount = json['booklistsCount'];
  }
  String? username;
  String? nickname;
  String? userId;
  String? avatarUrl;
  String? token;
  num? purchasedBooksCount;
  num? followersCount;
  num? readingCount;
  num? notesCount;
  num? booksReadCount;
  num? likesCOunt;
  num? booklistsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['nickname'] = nickname;
    map['userId'] = userId;
    map['avatarUrl'] = avatarUrl;
    map['token'] = token;
    map['purchasedBooksCount'] = purchasedBooksCount;
    map['followersCount'] = followersCount;
    map['readingCount'] = readingCount;
    map['notesCount'] = notesCount;
    map['booksReadCount'] = booksReadCount;
    map['likesCOunt'] = likesCOunt;
    map['booklistsCount'] = booklistsCount;
    return map;
  }

}