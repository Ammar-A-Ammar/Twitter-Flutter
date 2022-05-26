import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../../API/userdata.dart';
import '../../../components/greyLine_seperator.dart';

class LikesNotificationsPage extends StatefulWidget {
  LikesNotificationsPage({Key key}) : super(key: key);

  @override
  State<LikesNotificationsPage> createState() => _LikesNotificationsPageState();
}

class _LikesNotificationsPageState extends State<LikesNotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var listofLikeNotifications = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<String>(
            future: countFuture,
            builder: ((context, snapshot) {
              // if (snapshot.hasData) {
              //   idOfPost = snapshot.data;
              LikeNotifications(userdata.token);

              return getNotificationbody();
            }
                // else {
                //   return const Center(child: CircularProgressIndicator());
                // }
                )),
      ),
    );
  }

  LikeNotifications(tokenpassed) async {
    //await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/notifications/favourites'),
      ),
      headers: {
        'x-access-token': tokenpassed,
      },
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      List info = items;

      setState(
        () {
          listofLikeNotifications = info;
        },
      );
      //print(listofNotifications);
    } else {
      setState(
        () {
          print('take care cause the list of Tweets is empty');
          listofLikeNotifications = [];
        },
      );
    }
    //print(listofNotifications);
  }

  var idOfPost = '';

  List listOfTweets = [];

  Future<String> countFuture;

  Duration constantSuperDuration;

  @override
  void initState() {
    super.initState();
  }

  // Future<String> getTweetId(token) async {
  //   var response = await http.get(
  //     Uri.parse(
  //       ('http://twi-jay.me:8080/tweets/lookup/1/50'),
  //     ),
  //     headers: {
  //       'x-access-token': token,
  //     },
  //   );

  //   // print('md5l444444444');
  //   //print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     var posts = json.decode(response.body)[0];
  //     var infoOfPosts = json.decode(response.body)[0]['tweet'];
  //     var infoOfUser = json.decode(response.body)[0]['user'];
  //     idOfPost = infoOfPosts['_id'];
  //   } else if (response.statusCode == 400) {
  //     print('bad request');
  //   } else if (response.statusCode == 401) {
  //     print('Unauthorized');
  //   } else if (response.statusCode == 404) {
  //     print('Not Found');
  //   } else if (response.statusCode == 500) {
  //     print('Internal Server Error');
  //   }
  //   return idOfPost;
  // }

  Widget getNotificationbody() {
    return ListView.builder(
      itemCount: listofLikeNotifications.length,
      itemBuilder: (context, index) {
        return NotificationBox(
            listofLikeNotifications[index]); //Text('index $index');
      },
    );
  }

  Widget NotificationBox(NotificationItem) {
    //print("hereeee");
    var NotificationMessage = NotificationItem["notificationHeader"]['text'];
    var imageofuser = NotificationItem["notificationHeader"]['images'];
    var length = imageofuser.length;
    if (imageofuser.length == 0) {
      imageofuser = [
        'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
      ][0];
    }
    //print(imageofuser);
    var date = NotificationItem['created_at'];
    //var type = NotificationItem['notificationType'];
    var content;

    //print("favs");
    content = NotificationItem["notificationContent"]['text'];
    //print(content);

    //print(NotificationMessage);

    //var isRetweeted = useritem['user']['isAdmin'];
    // var isCommented = item['tweet']['date'];

    //var countOfComments = useritem['user']['__v'];

    constantSuperDuration =
        Duration(seconds: 00, hours: 0, microseconds: 0, days: 1);
    Duration myDuration1 = Duration(seconds: 15, days: 0);

    var timeParsed = DateTime.parse(date).toLocal();
    var dateFormated = DateFormat.jm().format(timeParsed);

    // //List URLss = item['URLs'];
    // /* if (URLss.isEmpty) {
    //   URLs = 'URLss';
    // } else {
    //   URLs = URLss[0];
    // }

    /* print('here is the pictures');
    print(userdata.profileImage);
    print(userdata.profileImage.toString()); */
    // print("here");

    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 0, 0, 0),width: 0)),
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                length == 0
                    ? Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                            radius: 20,
                          ),
                        ],
                      )
                    : length == 1
                        ? Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(imageofuser[0] ==
                                        null
                                    ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                    : imageofuser[0]),
                                radius: 20,
                              ),
                            ],
                          )
                        : length == 2
                            ? Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(imageofuser[
                                                0] ==
                                            null
                                        ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                        : imageofuser[0]),
                                    radius: 20,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(imageofuser[
                                                1] ==
                                            null
                                        ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                        : imageofuser[1]),
                                    radius: 20,
                                  )
                                ],
                              )
                            : length == 3
                                ? Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(imageofuser[
                                                    0] ==
                                                null
                                            ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                            : imageofuser[0]),
                                        radius: 20,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(imageofuser[
                                                    1] ==
                                                null
                                            ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                            : imageofuser[1]),
                                        radius: 20,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(imageofuser[
                                                    2] ==
                                                null
                                            ? 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'
                                            : imageofuser[2]),
                                        radius: 20,
                                      )
                                    ],
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                                    radius: 20,
                                  ),
                SizedBox(
                  width: 7,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  NotificationMessage,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          /* Container(
              child: hasImageTweet
                  ? Image.network(imageOfTweet[0].toString())
                  : SizedBox()), */

          // Container(
          //   child: !hasImageTweet
          //       ? SizedBox()
          //       : (imageOfTweet[0].toString() == 'any')
          //           ? SizedBox()
          //           : Image.network(imageOfTweet[0].toString()),
          // ),

          GreyLineSeperator(),
        ],
      ),
    );
  }
}
