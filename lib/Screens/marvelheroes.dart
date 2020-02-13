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

/*   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
 */
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: data == null ? 1 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 80,
          child: GestureDetector(
            child: new Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: data[index]['thumbnail']['path'] == null
                            ? Container(
                                width: 100,
                                height: 100,
                                color: Colors.blueAccent,
                              )
                            : Image.network(
                                data[index]['thumbnail']['path'].toString() +
                                    '.' +
                                    data[index]['thumbnail']['extension']
                                        .toString(),
                                fit: BoxFit.fill,
                              ),
                      ),
                      Container(
                          child: Text(data[index]['name'] == null
                              ? ''
                              : data[index]['name'].toString())),
                    ]),
              ),
            ),
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        height: 300,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  data[index]['name'].toString(),
                                  style: TextStyle(fontSize: 28),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                height: 200,
                                child: Image.network(
                                  data[index]['thumbnail']['path'].toString() +
                                      '.' +
                                      data[index]['thumbnail']['extension']
                                          .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
