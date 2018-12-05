import 'package:flutter/material.dart';
import 'models/dog_model.dart';
import 'package:dogs/lists/dog_list.dart';
import 'pages/new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dogs App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  List<Dog> initialDogs = []
  ..add(Dog('spoti', 'Esikhawini, empangeni, kzn', 'usemncane uspoti'))
  ..add(Dog('dlayedwa', 'cingci, emtuba, kzn', 'uyalumana'));

  Future _show_new_dog_form() async{
    //navigating to a new page
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return AddDogFormPage();
        },
      ),
    );

    if(newDog != null){
      initialDogs.add(newDog);
      print(initialDogs);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //remove if you dont want appbar
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        actions: [ 
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _show_new_dog_form,
        ),
        ],
      ),
      body: Container(
        //adding box decoration
        decoration: BoxDecoration( //adding gradients or decorations
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1,0.5,0.7,0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: Center(
          child: DogList(initialDogs),
        ),
      )
    );
  }
}
