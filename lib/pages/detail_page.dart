import 'package:flutter/material.dart';

import '../widgets/gradient_background.dart';
import '../widgets/topbar.dart';

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
                  bottom: MediaQuery.of(context).size.height * .50),
              child: _backgroundImage(context, image),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.30),
              child: gradientBackground(
                Colors.transparent,
                Color.fromRGBO(35, 45, 59, 1),
              ),
            ),
            _infoColumn(context),
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

  Widget _infoColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        topBar(_context),
        SizedBox(
          height: MediaQuery.of(_context).size.height * 0.25,
        ),
        Text(
          title.split(' ').map((val) {
            if (val == title.split(' ').last) {
              return '\n' + val;
            } else {
              return val + ' ';
            }
          }).join(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 34),
        ),
      ],
    );
  }
}
