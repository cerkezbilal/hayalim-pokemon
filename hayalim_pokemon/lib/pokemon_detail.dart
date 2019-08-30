import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hayalim_pokemon/model/pokedex.dart';


class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}


class _PokemonDetailState extends State<PokemonDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.4),

      appBar: AppBar(title: Text(widget.pokemon.name,textAlign: TextAlign.center,),
        elevation: 0,
        backgroundColor: Colors.purpleAccent.withOpacity(0.6),
      ),

      body: OrientationBuilder(builder: (context,orientation){

        if(orientation == Orientation.portrait){

          return dikeyBody(context);
        }else{

          return yatayBody(context);

        }
      })
    );
  }

 Widget dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery
              .of(context)
              .size
              .height * (8 / 10),
          width: MediaQuery
              .of(context)
              .size
              .width - 20,
          left: 10,
          top: MediaQuery
              .of(context)
              .size
              .height * 0.06,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " +widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),

                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null ?
                   widget.pokemon.prevEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("İlk hali")],
                  ),

                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null ?
                   widget.pokemon.nextEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Son hali")],
                  ),

                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null ?
                    widget.pokemon.weaknesses.map((weakness) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              weakness,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Zayıflığı yok")],
                  ),

                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag:widget.pokemon.img,
              child: Container(
                width: 150,
                height: 130,
                child: Image.network(
                 widget.pokemon.img,
                  fit: BoxFit.contain,
                ),
              )),
        )
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 30,
      height: MediaQuery
          .of(context)
          .size
          .height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
                tag: widget.pokemon.img,
                child: Container(
                  width: 200,
                  child: Image.network(
                   widget.pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " +widget.pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),

                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null ?
                   widget.pokemon.prevEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("İlk hali")],
                  ),

                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:widget.pokemon.nextEvolution != null ?
                    widget.pokemon.nextEvolution.map((evolution) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              evolution.name,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Son hali")],
                  ),

                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null ?
                    widget.pokemon.weaknesses.map((weakness) =>
                        Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              weakness,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList() : [Text("Zayıflığı yok")],
                  ),

                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}


