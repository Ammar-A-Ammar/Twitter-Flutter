// ignore_for_file: file_names, avoid_unnecessary_containers, non_constant_identifier_names, unnecessary_new, avoid_print, avoid_init_to_null, unused_local_variable, duplicate_import, prefer_typing_uninitialized_variables, camel_case_types, unused_element, unnecessary_brace_in_string_interps, prefer_is_empty, must_be_immutable

// import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:twitter_app/API/userdata.dart';
import 'package:twitter_app/components/widgets/CustomNavBar2.0.dart';
import 'dart:convert';

import '../../API/userdata.dart';
import 'GraphPie.dart';

class AdminPage extends StatefulWidget {
  String token = userdata.token;
  final String adminToken;

  AdminPage({
    Key key,
    @required this.token,
    @required this.adminToken,
  }) : super(key: key);
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  final blockDurationController = TextEditingController();
  List users = [];

  var countOfUsers = 0;
  Future<int> numberOfUserFuture;
  //Future<int> numberOfTweetsFuture;
  Future<List> returnedDataFuture;
  var returnedData = [];
  static const String BaseURL = "http://twi-jay.me:8080";

  @override
  void initState() {
    super.initState();
    numberOfUserFuture = getNumberOfUsers(widget.token);
    returnedDataFuture = adminInformationIntegeration(userdata.token);

    //returnedDataFuture;
  }

  /*  Future<int> numberOfUsersIntegeration(token) async {
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/admin/showUsers'),
      ),
      headers: {
        'x-access-token': token,
      },
    );
    setState(() {
      Map mapResponse = json.decode(response.body);
      Map dataResponse = mapResponse['_id'];
      //NoUser = dataResponse['count'];
    });
    return numberOfTweetsFuture;
  } */

  @override
  Widget build(BuildContext context) {
    //print(widget.token);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.white,
            primary: true,
            titleTextStyle: TextStyle(
              color: Colors.pink,
            ),
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => CustomNavBar()),
                    );
                  },
                  icon: Image.asset(
                    "assests/images/FinalLogo.png",
                    scale: 10,
                  ),
                  iconSize: 20.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Admin Home Page",
                        style: TextStyle(fontSize: 25, color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              indicatorColor: Colors.blue,
              //labelColor: Colors.green,
              //onTap: ,
              tabs: [
                Tab(
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Users",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Stastics",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      child: FutureBuilder<int>(
                        future: numberOfUserFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            countOfUsers = snapshot.data;
                            return _AdminCard(
                              context: context,
                              count: countOfUsers,
                              icon: Icons.person,
                              name: " Number of\n Users",
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Container(
                      child: FutureBuilder<List>(
                        future: returnedDataFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            returnedData = snapshot.data;
                            return _AdminCard(
                              context: context,
                              count: returnedData[0],
                              icon: Icons.account_tree_outlined,
                              name: " Number of Tweets",
                            );
                          } else {
                            return /* _AdminCard(
                              context: context,
                              count: tweetCounts,
                              icon: Icons.percent_sharp,
                              name: " Number of Tweets",
                            ); */
                                const Center(
                                    child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Container(
                      child: FutureBuilder<List>(
                        future: returnedDataFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            returnedData = snapshot.data;
                            return _AdminCard(
                              context: context,
                              count: returnedData[2],
                              icon: Icons.star,
                              name: "   The Most \nfollowed User",
                            );
                          } else {
                            return _AdminCard(
                              context: context,
                              count: countOfUsers,
                              icon: Icons.star,
                              name: "   The Most \nfollowed User",
                            ); /* const Center(
                                child: CircularProgressIndicator()); */
                          }
                        },
                      ),
                    ),
                    Container(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "Most Followed Users",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        //Expanded(child: GraphBar(token: userdata.token))
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                child: FutureBuilder<int>(
                  future: numberOfUserFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      countOfUsers = snapshot.data;
                      getUsersIntegeration(widget.token);
                      return getBodyOfUsers();
                    } else {
                      getUsersIntegeration(widget.token);
                      return getBodyOfUsers();

                      /* const Center(
                        child: CircularProgressIndicator(),
                      ); */
                    }
                  },
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    " Age's Chart",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 300,
                    width: 300,
                    child: GraphPie(token: widget.token),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _AdminCard({
    @required IconData icon,
    @required var count,
    @required String name,
    @required BuildContext context,
  }) {
    return Card(
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      //margin: EdgeInsets.all(5),
      shadowColor: Colors.blue,
      elevation: 10,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Colors.blue,
                ),
                Flexible(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBlockList(item) {
    var name = item['name'];
    var userName = item['username'];
    var profilePic = item['profile_image_url'];
    var user_id = item['_id'];
    var isBlocked = item['admin_block']['blocked_by_admin'];
    return Container(
      height: 90,
      child: Card(
        elevation: 70,
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 134, 158, 209),
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      profilePic != null
                          ? BaseURL + '/' + profilePic.toString()
                          : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 22),
                    Text(
                      name.toString(),
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userName.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                //height: 22,
                width: 60,
              ),
              !isBlocked
                  ? MaterialButton(
                      minWidth: 30,
                      height: 30,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Duration',
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: blockDurationController,
                                    onSubmitted: (value) =>
                                        blockUserIntegeration(
                                            widget.token,
                                            user_id,
                                            blockDurationController.text),
                                    decoration: InputDecoration(
                                      hintText: "block duration in days",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  blockUserIntegeration(widget.token, user_id,
                                      blockDurationController.text);
                                },
                                child: Text(
                                  'Block',
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      color: Color.fromARGB(146, 206, 8, 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "  Block  ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  : MaterialButton(
                      minWidth: 30,
                      height: 30,
                      onPressed: () {
                        unBlockUserIntegeration(
                          widget.token,
                          user_id,
                        );
                      },
                      color: Color.fromARGB(146, 2, 223, 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "unBlock",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget getBodyOfUsers() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => cardBlockList(
        users[index],
      ),
    );
  }

  Future<List> adminInformationIntegeration(token) async {
    final allDataReturned = [];
    int tweetCount;
    Map mostFollowersResponse;
    var theMostFollowedPerson;
    var theMostFollowedPersonName;
    var theMostFollowedPersonUserName;

    Map dataResponse;
    var response = await http.get(
      Uri.parse(
        '$BaseURL/admin/dashBoard',
      ),
      headers: {'x-access-token': token},
    );
    setState(() {
      Map mapResponse0 = json.decode(response.body)[0];
      //Map mapResponse01 = json.decode(mapResponse0)[0];
      List mostFollowersResponse = mapResponse0['users_With_Most_Followers'];
      Map theMostFollowedPersondata = mostFollowersResponse[0];
      theMostFollowedPersonUserName = theMostFollowedPersondata['name'];
      theMostFollowedPersonUserName = theMostFollowedPersondata['username'];
      print('mapResponse0');
      print(theMostFollowedPersonName);
      print(theMostFollowedPersonUserName);

      Map mapResponse1 = json.decode(response.body)[1];
      tweetCount = mapResponse1['all_Tweets_Count'];

      Map mapResponse2 = json.decode(response.body)[2];
      tweetCount = mapResponse1['all_Tweets_Count'];

      allDataReturned.addAll([
        tweetCount,
        theMostFollowedPersonName,
        theMostFollowedPersonUserName,
      ]);
      // print('the list');
      // print(allDataReturned[0]);
      // print('this is the tweet count');
      // print(tweetCount);
    });
    return allDataReturned;
  }

  Future blockUserIntegeration(token, user_id, duration) async {
    Map dataDuration = {
      'duration': duration,
    };
    var response = await http.post(
      Uri.parse(
        '${BaseURL}/adminBlock/create?userid=${user_id}',
      ),
      body: dataDuration,
      headers: {
        'x-access-token': token,
      },
    );
    setState(() {
      if (response.statusCode == 200) {
        print('The user was block succesfuly');
      } else {
        print('block not working');
      }
    });
  }

  Future unBlockUserIntegeration(token, user_id) async {
    Map dataDuration = {};
    var response = await http.post(
      Uri.parse(
        '${BaseURL}/adminBlock/destroy?userid=${user_id}',
      ),
      body: dataDuration,
      headers: {
        'x-access-token': token,
      },
    );
    setState(() {
      if (response.statusCode == 200) {
        print('Unblock was clicked');
      } else {
        print('Unblock not working');
      }
    });
  }

  Future<int> getNumberOfUsers(token) async {
    var response = await http.get(
      Uri.parse(
        ('$BaseURL/admin/showUsers'),
      ),
      headers: {
        'x-access-token': token,
      },
    );
    setState(() {
      countOfUsers = json.decode(response.body).length;
      print('count of users is ');
      print(countOfUsers);
    });
    return countOfUsers;
  }

  Future getUsersIntegeration(token) async {
    //await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.parse(
        ('$BaseURL/admin/showUsers'),
      ),
      headers: {
        'x-access-token': token,
      },
    );
    if (response.statusCode == 200) {
      //print('i am in user integeration');
      var items = json.decode(response.body);
      List info = items;
      setState(() {
        users = info;
      });
    } else {
      setState(() {
        users = [];
      });
    }
  }
}
