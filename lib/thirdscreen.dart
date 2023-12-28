import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zaqaulapps/secondscreen.dart';

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  List<Map<String, dynamic>> alluser = [];
  int page = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    getAlluser();
  }

  Future<void> getAlluser() async {
    String urlUser = "https://reqres.in/api/users?page=1&per_page=10";

    try {
      var Response = await http.get(Uri.parse(urlUser));
      if (Response.statusCode == 200) {
        final Map<String, dynamic> dataUser = json.decode(Response.body);
        final List<dynamic> users = dataUser['data'];

        setState(() {
          alluser = List<Map<String, dynamic>>.from(users);
        });
      } else {
        throw Exception(
            'Unable to load data. Status code: ${Response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      alluser.clear();
      page = 1;
    });
    await getAlluser();
  }

  Future<void> _loadPage() async {
    setState(() {
      page++;
    });
    await getAlluser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Third Screen',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator
                  .push(context,
                MaterialPageRoute(
                  builder: (context) => Welcome(firstName: 'user', lastName: 'name' ,Profile: ''),
                ),
              );
            }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: RefreshIndicator(
          onRefresh: _refresh,
          child: alluser.isEmpty
              ? Center(
            child: Text('Loading'),
          )
              : ListView.builder(
            itemCount: alluser.length,
            itemBuilder: (context, index) {
              return _buildUser(index);
            },
          )
      ),
    );
  }

  Widget _buildUser(int Index) {
    return ListTile(
      onTap: () {
        _transferData(alluser[Index]['first_name'], alluser[Index]['last_name'], alluser[Index]['avatar']);
      },
      title: Text(
        '${alluser[Index]['first_name']} ${alluser[Index]['last_name']}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins'
        ),
      ),
      subtitle: Text(
        '${alluser[Index]['email']}',
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Poppins'
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(alluser[Index]['avatar']),
      ),
    );
  }
  void _transferData(String firstname, String lastname, String profile){
    Navigator
        .push(context, MaterialPageRoute(
      builder: (context) => Welcome(
        firstName : firstname,
        lastName : lastname,
        Profile: profile,

      ),
    ),
    );
  }
}

