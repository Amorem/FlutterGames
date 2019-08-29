import 'package:flutter/material.dart';

import '../widgets/gradient_background.dart';
import '../widgets/topbar.dart';
import '../data.dart';

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
            topBar(context),
            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.030,
                MediaQuery.of(context).size.height * 0.08,
                MediaQuery.of(context).size.width * 0.030,
                MediaQuery.of(context).size.width * 0.005,
              ),
              child: _infoColumn(context),
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

  Widget _infoColumn(BuildContext _context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
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
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 32),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(_context).size.height * 0.02,
              0,
              MediaQuery.of(_context).size.height * 0.02),
          child: Text(
            'EA Games',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.red[900],
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        _infoText(),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(_context).size.height * 0.04,
              0,
              MediaQuery.of(_context).size.height * 0.02),
          child: Text(
            'Snapshot',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _snapshotsList(_context, screenshots),
      ],
    );
  }

  Widget _infoText() {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
    );
  }

  Widget _snapshotsList(BuildContext _context, List<String> snapshots) {
    return SizedBox(
      height: MediaQuery.of(_context).size.height * 0.18,
      width: MediaQuery.of(_context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshots.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              width: MediaQuery.of(_context).size.width * .50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(snapshots[index]),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
      ),
    );
  }
}
