import 'package:flutter/material.dart';
import 'package:dogs/models/dog_model.dart';

class dog_detail_page extends StatefulWidget{
  final Dog dog;

  dog_detail_page(this.dog);

  @override
  _dog_detail_page_state createState() => _dog_detail_page_state();
}

class _dog_detail_page_state extends State<dog_detail_page>{
  //dog picture size
  final double dog_avatar_size = 150.0;
  double _slider_value = 10.0;

    Future<Null> _rating_error_dialog() async{
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Error'),
          content: Text("They're good dogs, Brant."),
          actions: <Widget>[
            FlatButton(
              child: Text('Try again'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

  void update_rating(){
    if(_slider_value < 10){
      _rating_error_dialog();
    }else{
      setState(() => widget.dog.ratings = _slider_value.toInt());
    }
    setState(() => widget.dog.ratings = _slider_value.toInt());
  }

  void update_slider(double new_rating){
    setState(() => _slider_value = new_rating);
  }

  Widget get add_your_rating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (new_rating) => update_slider(new_rating),
                    value: _slider_value,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_slider_value.toInt()}', style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),
        submit_rating_button,
      ],
    );
  }

  Widget get submit_rating_button{
    return RaisedButton(
      onPressed: () => update_rating,
      child: Text('submit'),
      color: Colors.indigoAccent,
    );
  }

  Widget get dog_image{
    return Container(
      height: dog_avatar_size,
      width: dog_avatar_size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            offset: const Offset(1.0, 2.0),
            blurRadius: 2.4,
            spreadRadius: -1.0,
            color: const Color(0x33000000)
          ),
          const BoxShadow(
            offset: const Offset(2.0, 1.0),
            blurRadius: 3.0,
            spreadRadius: 0.0,
            color: const Color(0x12000000)
          ),
          const BoxShadow(
            offset: const Offset(3.0, 1.0),
            blurRadius: 4.0,
            spreadRadius: 2.0,
            color: const Color(0x1f000000)
          )
        ],

        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.dog.imageUrl),
        )
      ),
    );
  }

  Widget get ratings{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text('${widget.dog.ratings} / 10', style: Theme.of(context).textTheme.display2)
      ],
    );
  }

  Widget get dog_profile{
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dog_image,
          Text(
            '${widget.dog.name}',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          ratings
        ],
      ),

    );
  }

  @override
    Widget build(BuildContext context) {
      //add scafold on the new page everytime
      return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Meet ${widget.dog.name}'),
        ),
        //we are changing the body to alist view so we can add multiple custome components here and also include all the  pre built components as well
        // body: dog_profile,
        body: ListView(
          children: <Widget>[dog_profile, add_your_rating],
        ),
      );
    }
}