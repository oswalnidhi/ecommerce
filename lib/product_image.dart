
//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;
import 'package:flutter_app1/shopkeeperdashboard.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
void main() {
  runApp(MyAppp());
}
class MyAppp extends StatefulWidget {
  final String name;
  final String l;
  const MyAppp(
      {Key key, this.name,this.l})
      : super(key: key);
  // This widget is the root of your application.
  @override
  State<MyAppp> createState() => _MyAppState();
}
class _MyAppState extends State<MyAppp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: MyHomePage(title: 'UPLOAD IMAGES',user:widget.name,m : widget.l),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.user,this.m}) : super(key: key);
  final String m;
  final String user;
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Asset> images = <Asset>[];
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        );
      }),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;
    setState(() {
      images = resultList;

    });
  }
  Future uploadmultipleimage() async {
    var uri = Uri.parse("http://192.168.137.20:8081/photo");
    http.MultipartRequest request = new http.MultipartRequest('POST', uri);
    request.headers[''] = '';
    request.fields['product'] = widget.user;
    request.fields['license'] = widget.m;
    List<http.MultipartFile> newList = new List<http.MultipartFile>();
    for (int i = 0; i < images.length; i++) {
      ByteData byteData = await images[i].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      http.MultipartFile multipartFile = new http.MultipartFile.fromBytes(
        "userPhoto",
        imageData,
        filename: 'some-file-name.jpg',
        contentType: MediaType("image", "jpg"),
      );
      newList.add(multipartFile);
    }
    request.files.addAll(newList);
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text(widget.title,
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(150,0,50,0),
            child: Center(
              child: Row(

                children: [
                  ElevatedButton(
                    child: Text("Pick Images"),
                    onPressed: loadAssets,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height : 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(150,0,50,0),
            child: Center(
              child: Row(
                children: [
                  ElevatedButton(
                      child: Text("Upload Images"),
                      onPressed:() {uploadmultipleimage();
                      var l= widget.m;
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => dashboard(license:l,)));
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                      }
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
            buildGridView(),
          ) ,
        ],
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    // title: const Text('Popup example'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("your product has been added"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}