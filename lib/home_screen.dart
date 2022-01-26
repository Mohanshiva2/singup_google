import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singup_google/login_screen.dart';
import 'package:singup_google/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState() {
    FirebaseFirestore.instance
    .collection('users')
    .doc(user!.uid)
    .get()
    .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent.shade400,Colors.black.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),

        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "User Name: ${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black,fontSize: 20),
              ),
              SizedBox(height: 20,),
              Text(
                'Email id: ${loggedInUser.email}',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black,fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              ActionChip(
                backgroundColor: Colors.cyan,
                  label: Text('LogOut'),
                  onPressed: () {
                    logout(context);
                  }
                  ),
              // GestureDetector(
              //
              //   child: Container(
              //     padding: EdgeInsets.all(30),
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Colors.blueAccent.shade400,Colors.black12
              //         ],
              //         begin: Alignment.topLeft,
              //         end: Alignment.topRight,
              //       ),
              //     ),
              //     child: Column(
              //       children: [
              //         Text('LogOut')
              //       ],
              //     ),
              //   ),
              //   onTap: () {
              //     logout(context);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
