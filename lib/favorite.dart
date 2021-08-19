import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_life/data.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  var _listScrollController = ScrollController();
  var _scrollDirection = ScrollDirection.idle;
  @override
  void initState() {
    _listScrollController.addListener(() {
      setState(() {
        _scrollDirection = _listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(Notification notification) {
    setState(() {
      if (notification is ScrollEndNotification)
        _scrollDirection = ScrollDirection.idle;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        color: Colors.transparent,
        child: NotificationListener(
          onNotification: _scrollNotification,
          child: ListView(
            controller: _listScrollController,
            scrollDirection: Axis.horizontal,
            children: data.map((item) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 100),
                transform: Matrix4.rotationZ(
                    _scrollDirection == ScrollDirection.forward
                        ? 0.07
                        : _scrollDirection == ScrollDirection.reverse
                            ? -0.07
                            : 0),
                width: 200,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(item["color"]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Color(item["color"]).withOpacity(0.6),
                        offset: Offset(-6, 4),
                        blurRadius: 10)
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
