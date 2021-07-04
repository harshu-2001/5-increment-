
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
class _priceState extends State<price> {
  final myController = TextEditingController();
  List<DropdownMenuItem<double>> listdrop=[];
  void loaddata(){
  if (listdrop.isEmpty)
  {
    listdrop.add(new DropdownMenuItem(child: new Text("5%"),
    value: 0.05,)
    
    );
    listdrop.add(new DropdownMenuItem(child: new Text("10%"),
    value: 0.10,));
    listdrop.add(new DropdownMenuItem(child: new Text("15%"),
    value: 0.15,));
    listdrop.add(new DropdownMenuItem(child: new Text("20%"),
    value: 0.20,));}
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  var ok;
  var percentage;
  @override
  Widget build(BuildContext context) {
    
    loaddata();
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
          DropdownButton(
            iconSize: 20.0,
            value: ok,
            items: listdrop,
            focusColor: Colors.blueAccent.shade400,
            
            dropdownColor: Colors.blueAccent.shade100,
            hint: Text("select value"),
            onChanged: (values){
                
                setState(() {
                  ok=values!;
                  percentage=ok;
                  
                  
                });
            },
          ),
        SizedBox(height: 30.0,),
            FloatingActionButton(
              onPressed: () {
          var amount=double.parse(myController.text);
          var convert=amount+amount*percentage;
          convert=convert.round() as double;
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