import 'package:flutter/material.dart';
import 'package:zaqaulapps/secondscreen.dart';

class InputNameandPalindrome extends StatefulWidget {
  final String avatars;

  InputNameandPalindrome({Key? key, required this.avatars});

  @override
  State<InputNameandPalindrome> createState() => _InputNameandPalindromeState();
}

class _InputNameandPalindromeState extends State<InputNameandPalindrome> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _palindromeController = TextEditingController();

  bool palindrome1 = false;

  bool isPalindrome(String text){
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    String reverseText = cleanText.split('').reversed.join('');
    return cleanText == reverseText;
  }
  
  void checkPalindrome(){
    String name = _nameController.text;
    String palindrome = _palindromeController.text;

    String namePalindrome = name + palindrome;
    palindrome1 = isPalindrome(namePalindrome);

    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Result'),
          content: Text(
            palindrome1 ? '${name} ${palindrome}\n Is Palindrome ' :'${name}  ${palindrome}\n Is Not Palindrome ',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('${widget.avatars}'),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: _palindromeController,
                    decoration: InputDecoration(
                        hintText: 'Palindrome',
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins'
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
                SizedBox(
                  height: 50,
                  width: 370,
                  child: ElevatedButton(
                    onPressed: () {
                      checkPalindrome();
                    }, 
                    child: Text(
                      'CHECK',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      backgroundColor: Color.fromRGBO(43, 99, 123, 1)
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  width: 370,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator
                        .push(context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(firstName: 'user', lastName: 'name' ,Profile: ''),
                              ),
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                        backgroundColor: Color.fromRGBO(43, 99, 123, 1)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
