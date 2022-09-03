import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/Student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกคะแนนสอบ"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ชื่อ",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? fname) {
                    myStudent.fname = fname;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "นามสกุล",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? lname) {
                    myStudent.lname = lname;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "อีเมล",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? email) {
                    myStudent.email = email;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "คะแนนสอบ",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  onSaved: (String? score) {
                    myStudent.score = score;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "บันทึกข้อมูล",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      formKey.currentState?.save();
                      print("${myStudent.fname}");
                      print("${myStudent.lname}");
                      print("${myStudent.email}");
                      print("${myStudent.score}");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
