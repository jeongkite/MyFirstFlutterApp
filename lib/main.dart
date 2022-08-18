// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Tofindpeter Nowon',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  'Seoul, Korea',
                  style: TextStyle(
                    color: Colors.grey[500]
                  ),
                ),
              ],
              ),
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _bulidButtonColumn(color, Icons.call, 'CALL'),
        _bulidButtonColumn(color, Icons.near_me, 'ROUTE'),
        _bulidButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(padding: EdgeInsets.all(32),
      child: Text(
        '분위기는 참 좋았다. 위 사진에서 보이듯 와인도 판매하는 레스토랑이었음. '
        '와인은 아니었지만 오렌지 샹그리아였나 어쨌든 술 종류를 하나 마셨는데 맛있었다. '
        '음식은 생각보다 양이 많았다. 맛은 막 그렇게 좋지 않았다. 면이 두꺼웠는데 그게 참 특이했다. '
        '근데 나는 일반적인 스파게티 면이 제일 맛있는 것 같다. '
        '언제나 그렇듯 토마토 해산물 파스타를 먹었는데 오 또 오고싶다~! 이런건 아녔음. ',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: ListView(children: [
          Image.asset(
            'images/wine.jpg',
            width: 300,
            height: 400,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],)
      ),
    );
  }

  Column _bulidButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(child: Text('$_favoriteCount')),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}