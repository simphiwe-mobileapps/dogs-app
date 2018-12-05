import 'package:flutter/material.dart';
import 'package:dogs/models/dog_model.dart';
import 'package:dogs/partial_views/dog_card.dart';

class DogList extends StatelessWidget{
  final List<Dog> dogs;
  DogList(this.dogs);

  @override
  Widget build(BuildContext context){
    return _buildList(context);
  }

  ListView _buildList(context){
    return ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, int){
        return DogCard(dogs[int]);
      },
    );
  }
}