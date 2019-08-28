import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String image;

  DetailPage({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .60),
              child: _backgroundImage(context, image),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage(BuildContext _context, String image) {
    return Container(
      width: MediaQuery.of(_context).size.width,
      height: MediaQuery.of(_context).size.height,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
    );
  }
}
