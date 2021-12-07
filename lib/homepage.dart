import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()=>context.beamToNamed('/books'), 
          child: const Text('Show Books')
        ),
      ),
    );
  }
}
