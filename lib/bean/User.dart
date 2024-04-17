import 'dart:convert';
/// username : "six"
/// nickname : "luke"
/// userId : "123456789"
/// avatarUrl : "https://c-ssl.dtstatic.com/uploads/blog/202201/23/20220123222213_2899a.thumb.400_0.jpeg"
/// token : "c7c53812312312312312312"
/// balance : 9.32
/// pricePerMonth : 9
/// purchasedBooksCount : 10
/// followersCount : 100
/// readingCount : 50
/// readingTime : 12000
/// notesCount : 20
/// booksReadCount : 30
/// likesCOunt : 50
/// booklistsCount : 5
/// ranking : 3

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.username, 
      this.nickname, 
      this.userId, 
      this.avatarUrl, 
      this.token, 
      this.balance, 
      this.pricePerMonth, 
      this.purchasedBooksCount, 
      this.followersCount, 
      this.readingCount, 
      this.readingTime, 
      this.notesCount, 
      this.booksReadCount, 
      this.likesCOunt, 
      this.booklistsCount, 
      this.ranking,});

  User.fromJson(dynamic json) {
    username = json['username'];
    nickname = json['nickname'];
    userId = json['userId'];
    avatarUrl = json['avatarUrl'];
    token = json['token'];
    balance = json['balance'];
    pricePerMonth = json['pricePerMonth'];
    purchasedBooksCount = json['purchasedBooksCount'];
    followersCount = json['followersCount'];
    readingCount = json['readingCount'];
    readingTime = json['readingTime'];
    notesCount = json['notesCount'];
    booksReadCount = json['booksReadCount'];
    likesCOunt = json['likesCOunt'];
    booklistsCount = json['booklistsCount'];
    ranking = json['ranking'];
  }
  String? username;
  String? nickname;
  String? userId;
  String? avatarUrl;
  String? token;
  num? balance;
  num? pricePerMonth;
  num? purchasedBooksCount;
  num? followersCount;
  num? readingCount;
  num? readingTime;
  num? notesCount;
  num? booksReadCount;
  num? likesCOunt;
  num? booklistsCount;
  num? ranking;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['nickname'] = nickname;
    map['userId'] = userId;
    map['avatarUrl'] = avatarUrl;
    map['token'] = token;
    map['balance'] = balance;
    map['pricePerMonth'] = pricePerMonth;
    map['purchasedBooksCount'] = purchasedBooksCount;
    map['followersCount'] = followersCount;
    map['readingCount'] = readingCount;
    map['readingTime'] = readingTime;
    map['notesCount'] = notesCount;
    map['booksReadCount'] = booksReadCount;
    map['likesCOunt'] = likesCOunt;
    map['booklistsCount'] = booklistsCount;
    map['ranking'] = ranking;
    return map;
  }

}