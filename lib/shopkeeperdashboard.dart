import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/demo.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:flutter_app1/product1.dart';
import 'package:flutter_app1/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(dashboard());
}

class dashboard extends StatefulWidget {
  final String license;
  const dashboard(
      {Key key, this.license})
      : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(user:widget.license),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String user;
  const MyHomePage(
      {Key key, this.user})
      : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  post()async{
    var url = Uri.parse('http://192.168.137.154:8080/product_list');
    var response =
    await http.post(url, body: {"user":widget.user});

    print(response.body);
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => productlist(l:response.body)),
    );

  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow[50],
      appBar: myAppBar('DASHBOARD'),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin:EdgeInsets.fromLTRB(5, 5, 5, 40),
                  height: 430,
                  width: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        child:
                        PinchZoom(
                          image: Image.network(
                              "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                          resetDuration: const Duration(milliseconds: 100),
                          maxScale: 2.5,
                          onZoomStart: () {
                            print('Start zooming');
                          },
                          onZoomEnd: () {
                            print('Stop zooming');
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        child: PinchZoom(
                          image: Image.network(
                              "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                          resetDuration: const Duration(milliseconds: 100),
                          maxScale: 2.5,
                          onZoomStart: () {

                          },
                          onZoomEnd: () {

                          },
                        ),

                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        child: PinchZoom(
                          image: Image.network(
                              "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                          resetDuration: const Duration(milliseconds: 100),
                          maxScale: 2.5,
                          onZoomStart: () {
                            print('Start zooming');
                          },
                          onZoomEnd: () {
                            print('Stop zooming');
                          },
                        ),),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        width: 450,
                        height: 400,
                        color: Colors.white,
                        /*child: PhotoView(
                  imageProvider: NetworkImage("https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                )*/
                        child: PinchZoom(
                          image: Image.network(
                              "https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
                          resetDuration: const Duration(milliseconds: 100),
                          maxScale: 2.5,
                          onZoomStart: () {
                            print('Start zooming');
                          },
                          onZoomEnd: () {
                            print('Stop zooming');
                          },
                        ),),],),),

                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 45,
                    child: ElevatedButton(
                      onPressed: (){
                        final us = widget.user;
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => App(v:us,)));
                      },


                      child: Center(
                        child: Text(
                          'ADD PRODUCT',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ],),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyApp()));
                  },


                  child: Center(
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 45,
              child: ElevatedButton(onPressed:(){
                post();
                },
                child: Center(
                  child: Text(
                    'Product List', style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  ),
                ),
              )

            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 45,
              child: ElevatedButton(onPressed: (){},
                child: Center(
                  child: Text(
                    'Order List',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),),
             


            SizedBox(height: 30),
            //here we can add our code

          ]),


    );
  }
}
class productlist extends StatefulWidget {
  final  String l;
  const productlist({Key key ,this.l}) : super(key: key);

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {
  get names => json.decode(widget.l) as List;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text("Product List"),
      ),
      body:ListView.builder(
// scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                int j =index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => prod(n:widget.l ,i:index)),
                );
              },
              title:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 3.0),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(2),
                      color: Colors.teal[50],
                      child: Center(
                          child: Text(
                            '${names[index]['nameoftheproduct']}',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),

            );


          }),
    );
  }
}


class prod extends StatefulWidget {
  final  n,i;
  const prod({Key key,this.n,this.i}) : super(key: key);

  @override
  State<prod> createState() => _prodState();
}

class _prodState extends State<prod> {
  get product => json.decode(widget.n) as List;


  @override
  Widget build(BuildContext context) {
    var index = widget.i;
    return Scaffold(
      appBar: AppBar(
        title:Text("Product info"),
      ),
body:  ListTile(
    title: Padding(
          padding: const EdgeInsets.all(10.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

      Image(
      image: NetworkImage("http://192.168.137.154:8080/getImage"),
      fit: BoxFit.fill,
      ),

      SizedBox(height: 6.0),
      Text(
      "NAME:${product[index]["nameoftheproduct"]}",
      style: TextStyle(
      fontSize: 20.0,

      color: Colors.grey[800],
      ),
      ),
      SizedBox(height: 6.0),
      Text(
      "DESCRIPTION :${product[index]["description"]}",
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.grey[800],
      ),
      ),
      SizedBox(height: 6.0),
      Text(
      "SPECIFICATION:${product[index]["specification"]}",
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.grey[800],
      ),
      ),
      SizedBox(height: 6.0),
      Text(
      "COST:${product[index]["cost"]}",
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.grey[800],
      ),
      ),
      SizedBox(height: 6.0),
      Text(
      "DELIVERY COST:${product[index]["delivarycost"]}",
      style: TextStyle(
      fontSize: 20.0,
      color: Colors.grey[800],
      ),
      ),
      ],
      ),
      ),
  ),
    );
  }
}
//newsssss
//nwe
//nemwemew
///////
