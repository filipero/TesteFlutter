import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiList extends StatefulWidget {
  static const routeName = '/apilist';
  static const pageTitle = 'Listagem a partir de uma API REST';
  @override
  ApiListState createState() => new ApiListState();
}

class ApiListState extends State<ApiList> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApiList.pageTitle),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            child: Card(
              child: Text(data[index]["title"]),
            ),
          );
        },
      ),
    );
  }
}
