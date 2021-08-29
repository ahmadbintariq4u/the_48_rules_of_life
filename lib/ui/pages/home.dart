import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_life/bloc/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // forceElevated: true,
          // systemOverlayStyle: SystemUiOverlayStyle.dark,

          elevation: 30,
          backgroundColor: Colors.blueAccent,
          shadowColor: Colors.grey,
          // leading: Padding(
          //   padding: const EdgeInsets.fromLTRB(24, 18, 0, 16),
          //   child: Icon(Icons.info),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 20, 16),
              child: IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.info,
                    // padding: EdgeInsets.all(10),
                    title: "The 48 Laws of Power Paperback – September 1, 2000",
                    desc: "Robert Greene (Author)",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      ),
                      DialogButton(
                        child: Text(
                          "Visit Page",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          _launchURL();
                          Navigator.pop(context);
                        },
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0)
                        ]),
                      )
                    ],
                  ).show();
                },
              ),
            ),
            SizedBox(
              width: 12,
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          floating: true,
          pinned: true,
          collapsedHeight: MediaQuery.of(context).size.height * 0.1,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://images.unsplash.com/photo-1423592707957-3b212afa6733?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
              fit: BoxFit.cover,
            ),

            title: AutoSizeText.rich(
              TextSpan(
                text: 'The 48 Rules',
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

            collapseMode: CollapseMode.parallax,
            stretchModes: [StretchMode.fadeTitle],
            // titlePadding: EdgeInsets.only(top: 2),
          ),
        ),
        // testWidget(),
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

  Widget testWidget() => SliverToBoxAdapter(
        child: ListView(
          children: Data.the_48_rules.map((item) {
            return Container(
              child: Text(item.shortDescription),
            );
          }).toList(),
        ),
      );

  final _url =
      'https://www.amazon.com/48-Laws-Power-Robert-Greene/dp/0140280197';

  void _launchURL() async {
    // await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Cannot launch';
    }
    print('hello');
  }
}


// ListTile(
//                   title: Text(
//                     Data.the_48_rules[index].shortDescription,
//                     style: GoogleFonts.ubuntu(fontSize: 14),
//                   ),
//                   trailing: Column(
//                     children: [
//                       Icon(Icons.favorite),
//                     ],
//                   ),
                   
//                 ),


// ExpansionTile(
//               title: Text('This is Expansion Tile'),
              // children: [
              //   Text(
              //       'This is expanded text.. which is shown in a deme format for exploration purpose.')
              // ],
//             ),















// GridView.count(
//           // Create a grid with 2 columns. If you change the scrollDirection to
//           // horizontal, this produces 2 rows.
//           crossAxisCount: 2,
//           primary: false,
//           shrinkWrap: true,
//           // Generate 100 widgets that display their index in the List.
//           children: List.generate(100, (index) {
//             return Center(
//               child: Text(
//                 'Item $index',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             );
//           }),
//         ),