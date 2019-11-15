
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
    // LOCAL
    // final String _url = 'http://padelmobile.localhost/api/v1/';
    // final String baseUrl = 'http://backoffice.localhost';


    // PRODUCTION
    final String _url = 'http://mobile.forehand.se/api/v1/';
    final String baseUrl = 'http://backoffice.forehand.se';
    
    postData(data, apiUrl) async {
      var apiMainUri = _url + apiUrl + await _getToken();
      return await http.post(
        apiMainUri,
        body: jsonEncode(data),
        headers: _setHeaders());
    }
    
    getData(apiUrl) async {
    
     var apiMainUri = _url + apiUrl + await _getToken();
     print(apiMainUri);
     return await http.get(apiMainUri,
        headers: _setHeaders());
    }
    
  _setHeaders() => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?v=1&token=$token';
  }


}





////dlvrbwhqoy
///
///
// Name:ForehandPush
// Key ID:GDZ78YY36S
// Services:Apple Push Notifications service (APNs)