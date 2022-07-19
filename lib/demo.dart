import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/addtocart.dart';
import 'package:flutter_app1/cust_dash.dart';
Widget myAppBar(String title) {

  return AppBar(

    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black54),
    //background color of Appbar to green
    title: Center(child: Text(title,
    style: TextStyle(color: Colors.black87),
    )),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search,
        color: Colors.black54,
        ),
        onPressed: () {
          //action for search icon button
        },
      ),


    ],
  );
}
Widget card(names){
  ListView.builder(
    // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {

            //post(names[index]);
          },
          title: Padding(
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
                        '${names[index]}',
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
      });
}
Widget bottom(BuildContext context,user){
  // int _selectedIndex = 0;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  return Material(
      elevation: 7.0,
      color: Colors.white,
      child: Container(
      height: 50.0,
      //width: MediaQuery.of(context).size.width,
  color: Colors.white,
  child: Padding(
  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => custdashboard(p:"1223")),
    );
  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.home_filled,
  color: Colors.grey,
  ),
  ),
  ),

  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(user: '1223',)),
    );
  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.shopping_cart_rounded,
  color: Colors.grey
    ,
  ),
  ),
  ),
    InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyHomePage(user: '1223',)),
        // );
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        color: Colors.white,
        child: Icon(
          Icons.notifications_sharp,
          color: Colors.grey,
        ),
      ),
    ),
  InkWell(
  onTap: () {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => MyHomePage(user: '1223',)),
    //);

  },
  child: Container(
  height: 50.0,
  width: 50.0,
  color: Colors.white,
  child: Icon(
  Icons.account_box,
  color: Colors.grey,
  ),
  ),
  ),
  ]),
  )));
}
Widget myDrawer(context,p){
  return Drawer(
    child: SingleChildScrollView(

        child:Container(
           // color: Colors.black54,
            margin:EdgeInsets.only(top:50),
          //  color: Colors.black54,
            child:Column(children: <Widget>[

              ListTile(
                  leading:Icon(Icons.home , color: Colors.black54),

                  title:Text("Home"),
                  onTap:(){

                  }
              ),

              ListTile(
                  leading:Icon(Icons.person),
                  title:Text("Past orders"),
                  onTap:(){
                    // My Pfofile button action
                  }
              ),

              ListTile(
                  leading:Icon(Icons.search),
                  title:Text("Register more shops"),
                  onTap:(){

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildreg(p,context);
                      },
                    );
                  }
              )


            ],)
        )
    ),

  );
}
Widget _buildreg(p,context) {
  var variable;
  print(variable);
  print("rithal");
  return AlertDialog(
    // title: const Text('Popup example'),

    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(

          keyboardType: TextInputType.visiblePassword,
          onChanged:(value){
            variable=value;
          },

          validator: (value){
            if (value.isEmpty){
              return 'Registration Number required';
            }

            return null;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Registration Number',
              hintText: "Enter shop's registration number",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors
                      .blueGrey[600])
              )
          ),

        ),

      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
         // print(variable);
          if (variable != null) {
            postTest(variable, p, context);
            Navigator.of(context).pop();

          }

        },
        textColor: Colors.black54,
        child: const Text('Register'),
      ),
    ],
  );
}
postTest(variable,p,context) async {

  var url = Uri.parse('http://192.168.137.20:8081/reg');
  var response =
  await http.post(url, body: {"regno":variable, "user":p});
  print(response.body);
String text;
text= response.body;
 showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          title: Text("$text"),
        );
      });

}
class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton( icon:Icon(Icons.clear),onPressed: (){})];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
}