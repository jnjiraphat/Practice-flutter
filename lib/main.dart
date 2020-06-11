import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App')
      ),
      body: MyBody()
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FlowerCard('Daisy','hey','https://ci.lnwfile.com/j5fe4q.jpg'),
        FlowerCard('Rose','hey','https://transcode2.app.engoo.com/image/fetch/f_auto,c_lfill,w_800,h_600,dpr_3/https://assets.app.engoo.com/images/mSmbmA5J74lqS1VzMlODggUCwSQtLl69ggFzMDmLRme.jpeg'),
        FlowerCard('Sunflower','hey','https://www.tcs-mart.com/web/wp-content/uploads/2018/02/sunflower-1627193_960_720-600x600.jpg'),
      ],
    );
  }
}

class FlowerCard extends StatelessWidget {

  final String _text;
  final String _img;
  final String _content;
  

  const FlowerCard(this._text,this._content,this._img,{
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          elevation: 10,
          child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$_img')
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_text',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
            ),
            Container(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_content',
                ),
              ),
            )
          ]
        ),
    );
  }
}