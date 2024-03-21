import 'package:dio/dio.dart';

class ApiService{
  static const String baseUrl ='https://api.example.com';

  late Dio _dio;


  ApiService(){
    _dio = Dio(BaseOptions(baseUrl:baseUrl));
    //Here you can configure the DIO practical example, such as setting a timeout
  }

  Future<dynamic> login(String username,String password)async{
    const url ='/login';
    final data ={'username':username,'password':password};

    return _post(url,data);
  }

  Future<dynamic> getUser(String userId)async{
    final url ='/user/$userId';

    return _get(url);
  }

  //Encapsulation methods for other server-side interfaces

  //Send a Get request
  Future<dynamic> _get(String url)async{
    final options = Options(method:"get");
    return _sendRequest(url,null,options);
  }

  //Send a Post request
  Future<dynamic> _post(String url,dynamic data)async{
    final options = Options(method:"post");
    return _sendRequest(url,data,options);
  }

  //Send a request
 Future<dynamic> _sendRequest(String url,dynamic data,Options options)async{
    _addCommonParams(options);

    try {
      final response = await _dio.request(url, data: data, options: options);
   //  Process the data returned by the server
   if(response.statusCode ==200) {
     final responseData = response.data;
     if (responseData['success'] == true) {
       return responseData['data']; //Returns data on success
     } else {
       throw ApiException(
           responseData['errorCode'], responseData['errorMessage']); // An exception is thrown on failure
     }
   }else {
   throw ApiException(response.statusCode ??-1,'The network request failed');//If the status code is not 200, an exception is thrown
   }}
    catch(error){
   throw ApiException(-1,'The network request failed');// An exception is thrown when a network request fails
   }
 }

 //Add common parameters
  void _addCommonParams(Options options) {
    final timestamp = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    final token = 'your_user token'; // Let's say this is the user's token
    final sign = _generateSign(timestamp, token);
    final deviceId = 'your_device id'; // Let's say this is the unique identifier of the device
    final clientVersion = '1.0.0'; // Let's say this is the version number of the client

    options.headers ??= {};
    options.headers?.addAll({
      'timestamp': timestamp,
      'token': token,
      'sign': sign,
      'device_id': deviceId,
      'client_version': clientVersion,
    });
  }

  //Generate data signatures
String _generateSign(String timestamp,String token){
    //Here, data signatures are generated based on business logic
  //Timestamps and user tokens actually require more complex encryption algorithms
  return timestamp+token;
}

}

class ApiException implements Exception{
  final int errorCode;
  final String errorMessage;

  ApiException(this.errorCode,this.errorMessage);
}