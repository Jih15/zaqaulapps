import 'package:flutter/material.dart';
import 'package:zaqaulapps/firstscreen.dart';
import 'package:zaqaulapps/thirdscreen.dart';

class Welcome extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String Profile;

  Welcome({Key? key,required this.firstName, required this.lastName, required this.Profile}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputNameandPalindrome(avatars: '${widget.Profile}'),));
          }, icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'
                  ),
                ),
                Text(
                  '${widget.firstName} ${widget.lastName}',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'
                  ),
                ),
              ],
            ),
            Container(
              height: 500,
              alignment: Alignment.center,
              child: Text(
                '${widget.firstName} ${widget.lastName}',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator
                          .of(context)
                          .push(MaterialPageRoute(builder: (context) => Third()));
                    },
                    child: Text(
                      'Choose a User',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
