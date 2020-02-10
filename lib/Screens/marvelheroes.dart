import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MarvelHeroes extends StatefulWidget {
  MarvelHeroes({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MarvelHeroesState createState() => _MarvelHeroesState();
}

class _MarvelHeroesState extends State<MarvelHeroes> {

Map<String, dynamic> data;
Map<String, dynamic> chdata;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=spider&limit=20&ts=1&apikey=7568ebb3af2e8b30c165f2e7fd029aa4&hash=503f97cf67c106047ddfb8cfa145af58"),
        headers: {"Accept": "application/json"});
    this.setState(() {
      data = json.decode(response.body);
      chdata = data['data'];
    });
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount:20,
      itemBuilder: (BuildContext context,int index){
        return Card(child: Row(children: <Widget>[
          Container(child: Text(data['data']['results'][index]['name'].toString())),
          Container(child: Text(data['data']['results'][index]['thumbnail'].toString()))
          //Container(child:Image.network(data['data']['results'][index]['thumbnail']['path'].toString()+'.png')),
        ],),);

      },

    ); //Container(child:Text(data['data']['results'][0]['thumbnail']['path'].toString()));
  }
}
