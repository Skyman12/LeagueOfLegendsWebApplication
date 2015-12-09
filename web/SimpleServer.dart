import "dart:io";

void main() {
  HttpServer.bind('127.0.0.1', 8081).then((server) {
    server.listen((HttpRequest request) {
      request.uri.queryParameters.forEach((param, val) {
        print(param + '-' + val);
      });

      handleGet(request);

//      request.response.headers.add("Access-Control-Allow-Origin", "*");
//      request.response.headers.add("Access-Control-Allow-Methods", "POST,GET,DELETE,PUT,OPTIONS");

      request.response.statusCode = HttpStatus.OK;
      request.response.write("Success!");
      request.response.close();
    });
  });
}

void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");

  var serverRequest = HttpRequest.getString(req.uri.path).then(onDataLoaded);

}