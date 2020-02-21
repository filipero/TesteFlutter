import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarvelHeroes extends StatefulWidget {
  MarvelHeroes({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MarvelHeroesState createState() => _MarvelHeroesState();
}

class _MarvelHeroesState extends State<MarvelHeroes>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();
  int offset = 0;
  List<dynamic> data = new List();

  fetch() async {
    final response = await http.get(
        'https://gateway.marvel.com:443/v1/public/characters?&offset=${offset}&limit=1&ts=1&apikey=7568ebb3af2e8b30c165f2e7fd029aa4&hash=503f97cf67c106047ddfb8cfa145af58');
    if (response.statusCode == 200) {
      setState(() {
        data.addAll(json.decode(response.body)['data']['results']);
      });
    } else {
      throw Exception('Falha ao buscar imagens');
    }
  }

  fetchdata() {
    for (int i = 0; i < 10; i++) {
      offset += 1;
      fetch();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchdata();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.grey,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
                "https://i.annihil.us/u/prod/marvel/images/OpenGraph-TW-1200x630.jpg"),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              height: 80,
              child: GestureDetector(
                child: new Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                      data[index]['name'] == null
                          ? ''
                          : data[index]['name'].toString(),
                      style: TextStyle(fontSize: 32),
                    )),
                  ),
                ),
                onTap: () {
                  Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.grey[200],
                                height: 250,
                                width: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            data[index]['name'].toString(),
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          data[index]['description'].toString(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Image.network(
                                            data[index]['thumbnail']['path']
                                                    .toString() +
                                                '.' +
                                                data[index]['thumbnail']
                                                        ['extension']
                                                    .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                },
              ),
            );
          }, childCount: data.length),
        ),
      ],
    );
  }
}
