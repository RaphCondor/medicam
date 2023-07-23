import 'package:flutter/material.dart';
import 'next.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.teal[800],
        accentColor: Colors.teal[200],
      ),
      home: logo(),
      
    );
  }
}

class logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCam")
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Align(
                    alignment: Alignment(0,0),
                     child: Image.asset('assets/medicamlogo.png',
                       height: 150,
                       width: 150,
                   ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => diseaseChoices(context, index),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
    );
  }
}

final List<String> images = <String>['assets/pneum1.png','assets/bccopy.png','assets/melanoma.png'];
final List<String> model = <String>['assets/pneumonia_model.tflite','assets/breast_cancer_model.tflite','assets/melanoma_model.tflite'];
final List<String> labels = <String>['assets/pneumonia_label.txt','assets/breast_cancer_label.txt','assets/melanoma_label.txt'];
final List<String> title = <String>['Pneumonia','Breast Cancer','Skin Diseases'];

Widget diseaseChoices(BuildContext context, int index){
  return GestureDetector(
    onTap: () {
      final snackBar = SnackBar(content: Text("Tap"));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyDetailPage(model[index],labels[index],title[index])
          ),
      );
    },
    child: Container(
      height: 400,
      width: 400,
        child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.fromLTRB( 30, 30, 30, 30),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            child: Image.asset(images[index],
              fit: BoxFit.fill),
            )
            )
        );
}



