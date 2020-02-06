import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RandomGif extends StatefulWidget {
  @override
  _RandomGifState createState() => _RandomGifState();
}

class _RandomGifState extends State<RandomGif> {

  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Get a random gif'),),
    body: Center(child: Image.network(_imageUrl)),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.search), 
      onPressed: () {
        print('pressed');
        String url = 'https://api.giphy.com/v1/gifs/random?api_key=ei4yDoVJ1HxBojJNFnpeTnYmBhWGp0Wk&tag=fail&rating=G';
        get(url).then((res) {
          Map<String, dynamic> body = json.decode(res.body);
          setState(() {
            _imageUrl = body['data']['image_url'];
          });
        });
      },
    ),
    );
  }
}