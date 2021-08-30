import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.green,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => TestingWidget());
              },
              child: Text('Route To Next'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.green,
            child: ElevatedButton(
              onPressed: () {
                // Get.to(() => TestingWidget());
                Get.snackbar('This is title', 'this is message',
                    leftBarIndicatorColor: Colors.amber,
                    snackPosition: SnackPosition.TOP,
                    duration: Duration(seconds: 2),
                    icon: Icon(Icons.home),
                    mainButton: TextButton(
                        onPressed: () {}, child: Text('Hello Dear')));
              },
              child: Text('Open Snackbar'),
            ),
          ),
        ],
      ),
    );
  }
}

class TestingWidget extends StatelessWidget {
  const TestingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
