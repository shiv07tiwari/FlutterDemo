import 'dart:io';
import 'dart:convert';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description);


  Future getImageUrl() async {

    if (imageUrl != null) {
      return;
    }

    /// This is how http calls are done in flutter:
    HttpClient http = HttpClient();
    try {
      /// Use darts Uri builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      /// The dog.ceo API returns a JSON object with a property
      /// called 'message', which actually is the URL.
      imageUrl = json.decode(responseBody)['message'];

      print(imageUrl);
    } catch (exception) {
      print(exception);
    }
  }
}
