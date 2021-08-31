import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_life/bloc/data/data.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        mySliverAppBar(),
        mySliverList(),
      ],
    );
  }

  SliverAppBar mySliverAppBar() => SliverAppBar(
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
        title: AutoSizeText.rich(
          TextSpan(
            text: 'Favorites',
            style: GoogleFonts.carterOne(
                fontSize: MediaQuery.of(context).size.width * 0.06),
          ),
        ),
        centerTitle: true,
      );

  SliverList mySliverList() => SliverList(
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
                          Data.the48Rules[index].subtitle = 'Explanation:';
                        else
                          Data.the48Rules[index].subtitle =
                              'Tap for Explanation';
                      });
                    },
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0)
                          .copyWith(top: 4, bottom: 4, left: 0),
                      child: Text(
                        Data.the48Rules[index].subtitle,
                        style: GoogleFonts.b612(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.030),
                      ),
                    ),
                    title: Text(
                      "\"${Data.the48Rules[index].shortDescription}\"",
                      style: GoogleFonts.carterOne(
                          fontSize: MediaQuery.of(context).size.width * 0.045),
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
                        color: Data.the48Rules[index].isFavorite
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ))),
          childCount: 100,
        ),
      );
}
