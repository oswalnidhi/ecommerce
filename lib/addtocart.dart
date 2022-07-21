

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_app1/demo.dart';

import'package:quantity_input/quantity_input.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyHomePage());
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
  postTest() async {
print(widget.user);
    var url = Uri.parse('http://192.168.0.105:8081/item');
    var response =
    await http.post(url, body: {"user":widget.user});
    print(response.body);

  print(response.body);
  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => advertise(n:response.body,user:widget.user)),
      );


  }
  @override
  Widget build(BuildContext context) {
    postTest();

    return Container(

    );
  }
}
class advertise extends StatefulWidget {
  final String n,user;
  const advertise(
      {Key key,  this.n,this.user})
      : super(key: key);
  @override
  _advertiseState createState() => _advertiseState();
}

class _advertiseState extends State<advertise> {

  int number=1;
  get names => json.decode(widget.n) as List;
  //List names = json.decode(widget.n) as List;
  final sel=[false,false];
  List checkSelection=[];
  int total =0;

  addSelection()
  {
    for(int i=0;i<names.length;i++)
      checkSelection.add(false);

  }


Widget _builditem (){
    return   (names.length>0) ?ListView.builder(
        shrinkWrap: true,

        itemCount: names.length,

        itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              setState(() {

                sel.add(false);
                checkSelection[index]=!checkSelection[index];
                total= int.parse(names[index]['cost'])+total;

              });},
            title: Card(

              color: Colors.teal[50],
              child: Stack(
                children: [

                  Image(
                    image: NetworkImage("http://192.168.0.105:8081/getImage"),
                    alignment: Alignment.centerLeft,
                    width:130,
                    height:150,
                    fit: BoxFit.fill,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed:(){

                      }, icon: checkSelection[index]? Icon(Icons.check_box, color:Colors.green, ): Icon(Icons.check_box_outline_blank_sharp, color:Colors.grey, ),
                        alignment: Alignment.center,    ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed:(){
                        setState(() => names.removeAt(index));
                      }, icon: Icon(Icons.close, color:Colors.grey, ),
                        alignment: Alignment.center,    ),
                    ],
                  ),


                  Positioned(

                    left: 10,
                    right: 0,
                    top: 10,
                    child: Column(
                      children: [

                        Text("${names[index]['name']}\n₹${names[index]['cost']}  ",style: TextStyle(color: Colors.black87,fontWeight:  FontWeight.bold,fontSize: 20,),
                          textDirection: TextDirection.ltr ,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(240,40,0,20),
                          child: QuantityInput(  elevation: 2,value: number, inputWidth: 50,buttonColor: Colors.grey[700],  onChanged:(value) => setState(() => number =int.parse(value.replaceAll(',', '')))
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),

            ),

          );
        }

    ):Center(child: Text("No Items found in Cart", style: TextStyle(color: Colors.red,fontSize: 20),


    ),

    );
}
  @override

  Widget build(BuildContext context) {
    addSelection();

    return  Scaffold(

      appBar:myAppBar('SHOPPING CART'),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _builditem(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end ,
                  children: <Widget>[
                    Text('Total: \$' + total.toString() ,style: TextStyle(
                      fontSize: 20,


                    )),
                    SizedBox(width: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () {},
                        elevation: 0.5,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Pay Now',
                          ),
                        ),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),

        bottomNavigationBar: bottom(context,widget.user),
    );

  }
}