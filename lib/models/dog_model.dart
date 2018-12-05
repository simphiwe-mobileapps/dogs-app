import 'dart:io';
import 'dart:convert';
class Dog{
  String name;
  String location;
  String description;
  String imageUrl;

  int ratings = 10;
  Dog(this.name, this.location, this.description);

//this function gets the dog image
  Future getImageUrl() async{
    if(imageUrl != null){
      return;
    }

    //get image
    HttpClient http = new HttpClient();
    try{
      //using dart url builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();

      var response_body = await response.transform(utf8.decoder).join();
      var decoded = json.decode(response_body);

      var url = decoded['message'];
      imageUrl = url;
      //the response will contain a json response whe need to query a sing variable of that response which is message
      //imageUrl = json.decode(response_body)['message'];

      print('image url is ${imageUrl}');
    }catch(e){
      print(e);
    }
  }
}