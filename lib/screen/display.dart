import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta_meta.dart';

class disPlay extends StatefulWidget {
  const disPlay({Key? key}) : super(key: key);

  @override
  State<disPlay> createState() => _disPlayState();
}

class _disPlayState extends State<disPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("รายงานคะแนนสอบ"),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("students").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(child: document["score"]),
                      ),
                      title: Text(document["fname"] + document["lname"]),
                      subtitle: Text(document["email"]),
                    ),
                  );
                }).toList(),
              );
            }));
  }
}
