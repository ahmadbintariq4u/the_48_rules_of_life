import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatelessWidget {
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
          title: AutoSizeText.rich(
            TextSpan(
              text: 'Settings',
              style: GoogleFonts.carterOne(
                  fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
          ),
          centerTitle: true,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              SizedBox(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.light),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Appearance',
                                style: GoogleFonts.carterOne(fontSize: 20)),
                          ],
                        ),

                        /// first portion start

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Dark Mode',
                                      style:
                                          GoogleFonts.carterOne(fontSize: 14)),
                                  Switch(
                                      value: true,
                                      onChanged: (status) {
                                        Get.snackbar('Dark Mode: ', '$status');
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),

                        /// first portion end

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.notifications),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Notifications',
                                style: GoogleFonts.carterOne(fontSize: 20)),
                          ],
                        ),

                        /// second portion start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Remind me daily',
                                      style:
                                          GoogleFonts.carterOne(fontSize: 14)),
                                  Switch(
                                      value: true,
                                      onChanged: (status) {
                                        Get.snackbar('Dark Mode: ', '$status');
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),

                        /// second portion end

                        /// Third portion start

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.info),
                            SizedBox(
                              width: 10,
                            ),
                            Text('About Us',
                                style: GoogleFonts.carterOne(fontSize: 20)),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      style: ButtonStyle(
                                          alignment: Alignment.centerLeft),
                                      onPressed: () {},
                                      child: Text('Contact Us',
                                          style: GoogleFonts.carterOne(
                                              fontSize: 14)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),

                        /// Third portion end
                      ],
                    )),
              ),
              SizedBox(
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  child: Text(
                    'App Version 1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
