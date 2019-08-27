import 'package:flutter/material.dart';
import 'package:flutter_game/data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_imageScrollBackground()],
      ),
    );
  }

  Widget _imageScrollBackground() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(featuredGames[index].imageURL),
            ),
          ),
        );
      },
    );
  }
}
