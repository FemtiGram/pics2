import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget { // Widget class
  @override
    State<StatefulWidget> createState() {
      return AppState();
    }
}
 
class AppState extends State<App> {  // Widget State class //
  int counter = 0; // Instance variable that changes over time.
  List<ImageModel> images = [];


  void fetchImage() async {
    counter ++;
    final response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
        images.add(imageModel);
      });
    
  }
  
  Widget build(context) { // Build must include 3 things. Include build. Return widget. Have build context.
    return MaterialApp( // Return everything below to Widget. MatrialApp -> Basic functions. Like navigation. Almost all apps start with this.
    home: Scaffold( // Gives the nice white background
    body: ImageList(images), // ImageList. Pass images.
      floatingActionButton: FloatingActionButton( // Adds button by deafult lower right
        child: Icon(Icons.add), // Child will be added to FloatingActionButton as new widget. Widget inside widget.
        onPressed: fetchImage, // OnPressed Required by FloatingActionButton. No () - don't want to invoke fetchImage
      ),
      appBar: AppBar( // Adds the AppBar to the Scaffold
        title: Text('Lets see some images'), // Title of Scaffold
      ),
    ),
  );
  }
}

