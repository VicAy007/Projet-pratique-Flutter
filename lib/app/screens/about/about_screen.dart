import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  int count=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'About Screen',
                style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: 24,),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24,),
            Text(
              'Counter $count'
            ),
            SizedBox(height: 24,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  count++;
                });
              }, 
              child: Text(
                'Incrémenter'
              )
            ), 
            SizedBox(height: 24,),
              ElevatedButton(
              onPressed: (){
                setState(() {
                  count--;
                });
              }, 
              child: Text(
                'Décrémenter'
              )
            ),
            SizedBox(height: 24,),
              ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(label: 'Cancel', onPressed: (){}),
                      backgroundColor: Colors.purple,
                      content: Text(
                        'Hello from About Screen',
                      ),
                      duration: Duration(seconds: 5),
                    ),
                  );
                },
                child: Text(
                  'Message',
                  selectionColor: Colors.purple,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



/* onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    
                  ),
                ),
              );
            }, 
            child: Text(
              'Message',
            ) */