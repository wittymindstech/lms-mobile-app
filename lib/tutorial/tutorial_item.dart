// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TutorialItem extends StatefulWidget {
//   final String title;
//   final String url;

//   TutorialItem({this.title, this.url});

//   @override
//   _TutorialItemState createState() => _TutorialItemState();
// }

// class _TutorialItemState extends State<TutorialItem> {
//   Future<List> getData() async{
//     final response = await http.get(widget.url);
//     return json.decode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title),),
//       body: FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot){
//           if(snapshot.hasError) print(snapshot.error);
//           return snapshot.hasData ? ListVideo() : CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }

// class ListVideo extends StatelessWidget {
//   final List list;
//   ListVideo({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: list == null?0:list.length,
//         itemBuilder: (context, index){
//           return Text(list[index]['snippet']['title']);
//     });
//   }
// }

