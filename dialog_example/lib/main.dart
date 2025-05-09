import 'package:flutter/material.dart';
import 'View/ActivityPopup.dart';
import 'View/ShowDialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DialogExample Demo',
      home: DialogExample(),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showLdDialog(context, pages: [activityPopup(),activitySecondPopup()],dismissible: true,
                showCloseButton: false);
          },
          child: const Text('多個公告'),
        ),
        ElevatedButton(
          onPressed: () {
            showLdDialog(context, pages: [activityPopup()]);
          },
          child: const Text('單個公告'),
        ),
      ],
    );
  }

  //活動規則 demo
  Widget activityPopup() {
    return  ActivityPopup(
      title: '活动中獎公告',
      hasCancel: false,
      child: Column(
          children: [
            Text("恭喜您中了大獎", style: _normalTextStyle()),
          ]
      ),
    );
  }

  Widget activitySecondPopup() {
    return  ActivityPopup(
      title: '活動規則公告',
      hasCancel: false,
      child: Column(
          children: [
            Text("你用戶們持續的支持我們，謝謝", style: _normalTextStyle()),
          ]
      ),
    );
  }

  TextStyle _normalTextStyle() {
    return const TextStyle(color: Colors.black, fontFamily: 'PingFangSC', fontSize: 14);
  }
}



