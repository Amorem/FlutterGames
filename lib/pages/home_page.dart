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
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .30),
            child: gradientBackground(
                Colors.transparent, Color.fromRGBO(35, 45, 59, 1)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.025,
                MediaQuery.of(context).size.height * 0.05,
                MediaQuery.of(context).size.height * 0.025,
                MediaQuery.of(context).size.height * 0.001),
            child: _infoColumn(context),
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

  Widget _infoColumn(BuildContext _context) {
    return Column(
      children: <Widget>[
        _topBar(),
        SizedBox(
          height: MediaQuery.of(_context).size.height * 0.25,
        ),
        Text(
          'Assasin\' Creed Odyssey',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: MediaQuery.of(_context).size.height * 0.03),
        _gameList(_context, games),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(_context).size.height * 0.02,
              bottom: MediaQuery.of(_context).size.height * 0.02),
          child: _gameBanner(_context),
        ),
        _gameList(_context, games_2),
      ],
    );
  }
}

Widget _topBar() {
  return Container(
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
  );
}

Widget _gameList(BuildContext _context, List<GameData> games) {
  print(games[0].imageURL);
  return SizedBox(
    height: MediaQuery.of(_context).size.height * 0.18,
    width: MediaQuery.of(_context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: games.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
            width: MediaQuery.of(_context).size.width * .30,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(games[index].imageURL),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    ),
  );
}

Widget _gameBanner(BuildContext _context) {
  return Container(
    height: MediaQuery.of(_context).size.height * 0.15,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(featuredGames[1].imageURL),
      ),
    ),
  );
}
