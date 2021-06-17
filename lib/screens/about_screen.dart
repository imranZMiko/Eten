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
                height: deviceSize.height * 0.75,
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
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Imagine that what defines the alignment of the child is the corner it is touching. If you align it to the left, the child will touch the left corner. However, a child cannot be properly aligned if the parent doesnt fill all the space available, since if the parent takes the minimum possible space, the child will touch all corners of the parent.',
                        style: TextStyle(
                          fontSize: 20,
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
