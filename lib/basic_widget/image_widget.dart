import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyImageWidget is being built"); 
    return const Image(
      image: AssetImage("assets/logo.png"),
    
    );
  }
}
