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
      home: StatefulHomePage(),
    );
  }
}

class Content {
 final String text;
 final String description;
 final String img;
 Content(this.text,this.description,this.img);
}

class StatefulHomePage extends StatefulWidget {
  @override
  _StatefulHomePageState createState() => _StatefulHomePageState();
}

class _StatefulHomePageState extends State<StatefulHomePage> {

  final _formKey = GlobalKey<FormState>();

  String _inputText;
  String _inputDescript;
  String _inputImg = "https://www.tcs-mart.com/web/wp-content/uploads/2018/02/sunflower-1627193_960_720-600x600.jpg";
  List<Content> contents =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App')
      ),
      body: 
    Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Flower's name"),
                onSaved: (String value) {
                  _inputText = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                onSaved: (String value) {
                  _inputDescript = value;
                },
              ),
              RaisedButton(
                onPressed: (){
                  _formKey.currentState.save();
                  setState(() {
                    contents.insert(0,Content(_inputText,_inputDescript,_inputImg)); //เพราะจะมาอยู่หน้าสุด
                  });
                  _formKey.currentState.reset();
                },
                child: Text('Add Card'),
              ),
            ],  
          ),
        ),
        Expanded(
          child: contents.length==0 ? Center(child: Text('Empty'),) : 
                  ListView.builder(
                    itemCount: contents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FlowerCard(
                        contents[index].text, 
                        contents[index].description, 
                        contents[index].img
                      );
                    }
                  ),
        )
      ],
    ),

    
    );
  }
}


class FlowerCard extends StatelessWidget {

  final String _text;
  final String _img;
  final String _description;
  

  const FlowerCard(this._text,this._description,this._img,{
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
                  '$_description',
                ),
              ),
            )
          ]
        ),
    );
  }
}