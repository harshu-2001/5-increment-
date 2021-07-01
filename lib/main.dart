import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:price()));
}

// ignore: camel_case_types
class  price extends StatefulWidget {
  const price({ Key? key }) : super(key: key);

  @override
  _priceState createState() => _priceState();
}

// ignore: camel_case_types
class _priceState extends State<price> {final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: myController,
              ),
            ),
            SizedBox(height: 30.0,),
            FloatingActionButton(
              onPressed: () {
          var amount=int.parse(myController.text);
          var convert=amount+amount*0.05;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("$convert"),
              );
            },
          );
        },
        child: Icon(Icons.text_fields),
      ),
            
          ],
        ),
      ),
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        
    );
  }
}