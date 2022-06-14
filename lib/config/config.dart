String get hostName => 'http://127.0.0.1:8000';
String get api => '/api';

headersWithoutToken() => {
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };

headerswithToken(String token) => {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
