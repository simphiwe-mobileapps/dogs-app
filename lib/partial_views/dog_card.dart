import 'package:flutter/material.dart';
import 'package:dogs/models/dog_model.dart';
import 'package:dogs/pages/dog_detail_page.dart';

class DogCard extends StatefulWidget{
  final Dog dog;

  DogCard(this.dog);
  @override
  // State<StatefulWidget> createState() => _DogCardState(dog); 

  _DogCardState createState(){
    return new _DogCardState(dog);
  }
}

class _DogCardState extends State<DogCard>{
  Dog dog;
  String render_url;

  _DogCardState(this.dog);

  void initState(){
    super.initState();
    render_dog_pic();
  }

  void render_dog_pic() async{ 
    await dog.getImageUrl();

    setState(() {
      render_url = dog.imageUrl;
      });
  }

  

  @override
  Widget build(BuildContext context){
    //inkwell makes its children touchable making it easier to inject routing data
    return InkWell(
      onTap: ()=> show_dog_detail_page(),
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50.0,
              child: dog_card,
            ),
            Positioned(
              top: 7.5, 
              child: dog_image
              ),
          ],
        )
      ),
    ),
    );
  }






  Widget get dog_image{
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(render_url ?? ''),
        ),
      ),
    );
  }


  Widget get dog_card{
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
              widget.dog.name,
              style: Theme.of(context).textTheme.subhead
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.dog.ratings} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  } 


  show_dog_detail_page(){
  Navigator.of(context).push(new MaterialPageRoute(builder: (context){
        return new dog_detail_page(dog);
      }));
  }
}