import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:the_life/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          collapsedHeight: 80,
          expandedHeight: 180,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://images.unsplash.com/photo-1423592707957-3b212afa6733?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
              fit: BoxFit.cover,
            ),

            title: AutoSizeText.rich(
              TextSpan(
                text: 'The 48 Rules',
                style: TextStyle(),
                // children: [
                //   TextSpan(
                //       text: '\nby Robert Greene',
                //       style:
                //           TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
                // ],
              ),
              textAlign: TextAlign.end,
              maxFontSize: 50,
              minFontSize: 36,
              style: GoogleFonts.carterOne(textStyle: TextStyle(fontSize: 35)),
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
            (context, index) => Container(
              margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
              decoration: BoxDecoration(
                color: Colors.green[50],
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.red],
                    begin: Alignment.bottomLeft),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Text(
                  Data.the_48_rules[index].shortDescription,
                  style: GoogleFonts.ubuntu(fontSize: 14),
                ),
                trailing: Icon(Icons.favorite),
              ),
            ),
            // Builds 1000 ListTiles
            childCount: 20,
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



// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                   title: Text(Data.the_48_rules[index].shortDescription)),
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