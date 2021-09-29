// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// void main() {
//   runApp(CupertinoExample());
// }
//
// class CupertinoExample extends StatefulWidget {
//   @override
//   _CupertinoExampleState createState() => _CupertinoExampleState();
// }
//
// class _CupertinoExampleState extends State<CupertinoExample> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: ExamplePage());
//   }
// }
//
// class ExamplePage extends StatefulWidget {
//   @override
//   _ExamplePageState createState() => _ExamplePageState();
// }
//
// class _ExamplePageState extends State<ExamplePage> {
//   DateTime _setDate = DateTime.now();
//   Duration initialtimer = new Duration();
//   int selectitem = 1;
//
//   Widget datetimePicker() {
//     return CupertinoDatePicker(
//       initialDateTime: DateTime.now(),
//       onDateTimeChanged: (DateTime newdate) {
//         print(newdate);
//         setState(() {
//           dateTime = newdate.day.toString() +
//               '/' +
//               newdate.month.toString() +
//               '/' +
//               newdate.year.toString() +
//               ' ' +
//               newdate.hour.toString() +
//               ' hrs ' +
//               newdate.minute.toString() +
//               ' mins';
//         });
//       },
//       use24hFormat: true,
//       maximumDate: new DateTime(2021, 12, 30),
//       minimumYear: 2010,
//       maximumYear: 2021,
//       minuteInterval: 1,
//       mode: CupertinoDatePickerMode.dateAndTime,
//     );
//   }
//
//   Widget timePicker() {
//     return CupertinoTimerPicker(
//       mode: CupertinoTimerPickerMode.hms,
//       minuteInterval: 1,
//       secondInterval: 1,
//       initialTimerDuration: initialtimer,
//       onTimerDurationChanged: (Duration changedtimer) {
//         setState(() {
//           initialtimer = changedtimer;
//           time = changedtimer.inHours.toString() +
//               ' hrs ' +
//               (changedtimer.inMinutes % 60).toString() +
//               ' mins ' +
//               (changedtimer.inSeconds % 60).toString() +
//               ' secs';
//         });
//       },
//     );
//   }
//
//   Future<void> bottomSheet(BuildContext context, Widget child,
//       {double height}) {
//     return showModalBottomSheet(
//         isScrollControlled: false,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(13), topRight: Radius.circular(13))),
//         backgroundColor: Colors.white,
//         context: context,
//         builder: (context) => Container(
//             height: height ?? MediaQuery.of(context).size.height / 3,
//             child: child));
//   }
//
//   Widget button(String text, {Function onPressed, Color color}) {
//     return Container(
//       width: 200,
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 5),
//       color: color ?? Colors.redAccent,
//       child: MaterialButton(
//           child: Text(
//             '$text',
//             style: TextStyle(color: Colors.white),
//           ),
//           onPressed: onPressed),
//     );
//   }
//
//   String time;
//   String dateTime;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               button(
//                 "Cupertino date Picker",
//                 onPressed: () {
//                   bottomSheet(context, datetimePicker());
//                 },
//               ),
//               dateTime == null ? Container() : Text('$dateTime'),
//               button(
//                 "Cupertino Timer Picker",
//                 color: Colors.green,
//                 onPressed: () {
//                   bottomSheet(context, timePicker());
//                 },
//               ),
//               time == null ? Container() : Text('$time'),
//               button(
//                 "Cupertino Picker",
//                 color: Colors.blueAccent,
//                 onPressed: () {
//                   Widget child = Scaffold(
//                       appBar: AppBar(
//                         title: Text(
//                           "CupertinoPicker",
//                           textAlign: TextAlign.justify,
//                         ),
//                         backgroundColor: Colors.teal,
//                         actions: <Widget>[
//                           IconButton(
//                             icon: Icon(Icons.send),
//                             onPressed: () {},
//                           )
//                         ],
//                       ),
//                       body: Container(
//                         child: CupertinoPicker(
//                           magnification: 1.2,
//                           backgroundColor: Colors.black87,
//                           children: <Widget>[
//                             Text(
//                               "TextWidget",
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 20),
//                             ),
//                             button(
//                               'Button Widget',
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.home),
//                               color: Colors.white,
//                               iconSize: 40,
//                               onPressed: () {},
//                             )
//                           ],
//                           itemExtent: 80, //height of each item
//                           looping: true,
//                           onSelectedItemChanged: (int index) {
//                             selectitem = index;
//                           },
//                         ),
//                       ));
//                   bottomSheet(context, child,
//                       height: MediaQuery.of(context).size.height / 2);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }