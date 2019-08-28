import 'package:flutter/material.dart';

Widget topBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.height * 0.025,
        MediaQuery.of(context).size.height * 0.05,
        MediaQuery.of(context).size.height * 0.025,
        MediaQuery.of(context).size.height * 0.001),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
