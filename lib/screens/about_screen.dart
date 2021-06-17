import 'package:eten/widgets/blurred_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          BlurredImage(imageURL: 'Assets/Place4.png'),
          Center(
            child: Card(
              shadowColor: Colors.transparent,
              color: Color.fromRGBO(255, 255, 255, 0.65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 8.0,
              child: Container(
                height: deviceSize.height * 0.63,
                width: deviceSize.width * 0.8,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      alignment: Alignment.topCenter,
                      child: Image.asset('Assets/logo.png'),
                    ),
                    Center(
                      child: Text(
                        'Eten',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\nVersion : 1.0.1\n\nAuthors:\nNaima Hasan\nImran Zahid\n\nEten is the Dutch word for food, embodying the app\'s goal to provide feasible recipes for food based on the ingredients available to the user.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
