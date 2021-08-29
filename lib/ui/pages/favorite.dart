import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_life/bloc/data.dart';
import 'package:the_life/data/data.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  // var _listScrollController = ScrollController();
  // var _scrollDirection = ScrollDirection.idle;
  // @override
  // void initState() {
  //   _listScrollController.addListener(() {
  //     setState(() {
  //       _scrollDirection = _listScrollController.position.userScrollDirection;
  //     });
  //   });
  //   super.initState();
  // }

  // bool _scrollNotification(Notification notification) {
  //   setState(() {
  //     if (notification is ScrollEndNotification)
  //       _scrollDirection = ScrollDirection.idle;
  //   });
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 30,
          backgroundColor: Colors.blueAccent,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          floating: true,
          pinned: true,
          collapsedHeight: MediaQuery.of(context).size.height * 0.1,
          // expandedHeight: MediaQuery.of(context).size.height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://images.unsplash.com/photo-1423592707957-3b212afa6733?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
              fit: BoxFit.cover,
            ),
            title: AutoSizeText.rich(
              TextSpan(
                text: 'favorites',
                style: GoogleFonts.carterOne(
                    fontSize: MediaQuery.of(context).size.width * 0.06),

                // children: [
                //   TextSpan(
                //       text: '\nby Robert Greene',
                //       style:
                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
                // ],
              ),
            ),
            centerTitle: true,
          ),
        ),
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(

                    // margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      gradient: LinearGradient(
                          colors: [Colors.green, Colors.red],
                          begin: Alignment.bottomLeft),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ExpansionTile(
                      onExpansionChanged: (isExpanded) {
                        setState(() {
                          if (isExpanded)
                            Data.the_48_rules[index].subtitle = 'Explanation:';
                          else
                            Data.the_48_rules[index].subtitle =
                                'Tap for Explanation';
                        });
                      },
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0)
                            .copyWith(top: 4, bottom: 4, left: 0),
                        child: Text(
                          Data.the_48_rules[index].subtitle,
                          style: GoogleFonts.b612(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030),
                        ),
                      ),
                      title: Text(
                        "\"${Data.the_48_rules[index].shortDescription}\"",
                        style: GoogleFonts.carterOne(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.045),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                          child: Text(
                            'This is expanded text.. which is shown in a deme format for exploration purpose.',
                            style: GoogleFonts.lexendDeca(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
                          ),
                        ),
                      ],
                      textColor: Colors.black,
                      expandedAlignment: Alignment.centerLeft,
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Data.the_48_rules[index].isFavorite
                              ? Colors.blue
                              : Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ))),
            childCount: 100,
          ),
        )
      ],
    );
  }
}







//  return Center(
//       child: Container(
//         height: 250,
//         color: Colors.transparent,
//         child: NotificationListener(
//           onNotification: _scrollNotification,
//           child: ListView(
//             controller: _listScrollController,
//             scrollDirection: Axis.horizontal,
//             children: data.map((item) {
//               return AnimatedContainer(
//                 duration: Duration(milliseconds: 100),
//                 transform: Matrix4.rotationZ(
//                     _scrollDirection == ScrollDirection.forward
//                         ? 0.07
//                         : _scrollDirection == ScrollDirection.reverse
//                             ? -0.07
//                             : 0),
//                 width: 200,
//                 margin: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Color(item["color"]),
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color(item["color"]).withOpacity(0.6),
//                         offset: Offset(-6, 4),
//                         blurRadius: 10)
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
