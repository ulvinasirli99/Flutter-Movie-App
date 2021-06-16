import 'dart:io';

class NetworkException implements HttpException {
  
  final String errMsg;
  
  final String reqUrl;
  
  NetworkException(this.errMsg, this.reqUrl);


  @override
  // TODO: implement message
  String get message => errMsg;

  @override
  // TODO: implement uri
  Uri get uri => Uri.parse(reqUrl);

}
