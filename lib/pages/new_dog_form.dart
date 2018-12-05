import 'package:flutter/material.dart';
import 'package:dogs/models/dog_model.dart';

class AddDogFormPage extends StatefulWidget{
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage>{
  TextEditingController name_controller = TextEditingController();
  TextEditingController location_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();



  void submit_dog(BuildContext context){
    if(name_controller.text.isEmpty){
      //adding a snack bar if the dog name is empty
      Scaffold.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.redAccent,content: Text('A dog needs a name'),),
      );
    }else{
      var newDog = Dog(name_controller.text, location_controller.text, description_controller.text);
      Navigator.of(context).pop(newDog);
    }
  }

  @override
    Widget build(BuildContext context) {
      //this is the new dog form page styling

      return Scaffold(
        appBar: AppBar(
          title: Text('Add a new Dog'),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 32.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: name_controller,
                    onChanged: (v) => name_controller.text = v,
                    decoration: InputDecoration(
                      labelText: 'Name of your dog'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: location_controller,
                    onChanged: (v) => location_controller.text = v,
                    decoration: InputDecoration(
                      labelText: 'dog location'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: description_controller,
                    onChanged: (v) => description_controller.text = v,
                    decoration: InputDecoration(
                      labelText: 'dog description'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context){
                      return RaisedButton(
                        onPressed: ()=> submit_dog(context),
                        color: Colors.indigoAccent,
                        child: Text('Submit Dog'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
}