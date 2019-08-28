import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.5),
            child: _imageScrollBackground(),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .35),
            child: gradientBackground(
                Colors.transparent, Color.fromRGBO(35, 45, 59, 1)),
          ),
        ],
      ),
    );
  }

  Widget _imageScrollBackground() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: PageScrollPhysics(),
      itemCount: featuredGames.length,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(featuredGames[index].imageURL),
            ),
          ),
        );
      },
    );
  }
}
