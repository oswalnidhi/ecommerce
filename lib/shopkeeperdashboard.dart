import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/demo.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_app1/product1.dart';
import 'package:flutter_app1/login.dart';

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
  //final textController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //var k= widget.user;
  @override
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
                      /*child: PhotoView(
                  imageProvider: NetworkImage("https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg"),
                )*/
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
                        //child: Image.network(
                        //"https://previews.123rf.com/images/dizanna/dizanna1512/dizanna151200122/49716465-advertisement-word-cloud-business-concept.jpg",
                        //fit: BoxFit.cover,
                        //alignment: Alignment.center,
                        //
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
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 45,
              child: Material(
                color: Colors.yellow[200],
                child: Center(
                  child: Text(
                    'Order List',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 1, left: 20,right: 20),
                  child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(35),
                        1: FlexColumnWidth(15),},
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2.5),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                height: 40,
                                child: Text(
                                  'Product Name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                height: 42,
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 18,
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 1, left: 2,right:2),
                                height: 30,
                                child: Text(
                                  'Product 1 ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Column(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 2, left: 1),
                                height: 17,
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,

                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),


                      ]),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 45,
              child: Material(
                color: Colors.yellow[200],
                child: Center(
                  child: Text(
                    'Shop List',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 1, left: 1),
                    child: Table(
                        defaultColumnWidth: FixedColumnWidth(240.0),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2.5),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),
                          TableRow(children: [
                            Column(children: [
                              Container(
                                alignment: Alignment.center,
                                height:30,
                                padding: EdgeInsets.only(top: 1, left: 1),
                                child: InkWell(
                                  child: Text(
                                    'Shop 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          ]),


                        ]),
                  ),
                ]),
            Container(height:100),

          ]),
     // bottomNavigationBar: bottom(context),
    );
  }
}