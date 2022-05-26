// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_string_interpolations, must_be_immutable

//import 'dart:ffi';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';
import 'package:twitter_app/API/userdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Settings/bookmarkspage.dart';
import '../../components/greyLine_seperator.dart';
import '../../components/widgets/sidemenu.dart';
// import '../../model/tweet_model.dart';
import '../Settings/notificationspage.dart';

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class TimelinePage extends StatefulWidget {
  final String token;
  final String userName;
  final String nameOfUser;

  TimelinePage({
    Key key,
    @required this.token,
    this.userName,
    this.nameOfUser,
  }) : super(key: key);

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final scrollController = ScrollController();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final messgController = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    messgController.dispose();

    super.dispose();
  }

  bool scaffoldKey = false;
  //final Function addNewPosting;

  File addedimage;

  var idOfPost = '';
  var token = '';
  List listOfTweets = [];
  //List infoOfPosts = [];
  // List URLss = [];
  // var URLs;
  Future<String> countFuture;

  Duration constantSuperDuration;

  String BaseURL = 'http://twi-jay.me:8080';

  @override
  void initState() {
    super.initState();
    countFuture = getTweetId(userdata.token);
  }

  Future getTweet(tokenpassed) async {
    //await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/tweets/lookup/1/50'),
      ),
      headers: {
        'x-access-token': tokenpassed,
      },
    );
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      List info = items;
      setState(
        () {
          listOfTweets = info;
        },
      );
    } else {
      setState(
        () {
          print('take care cause the list of Tweets is empty');
          listOfTweets = [];
        },
      );
    }
  }

  Future<String> getTweetId(token) async {
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/tweets/lookup/1/50'),
      ),
      headers: {
        'x-access-token': token,
      },
    );

    // print('md5l444444444');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var posts = json.decode(response.body)[0];
      var infoOfPosts = json.decode(response.body)[0]['tweet'];
      var infoOfUser = json.decode(response.body)[0]['user'];
      idOfPost = infoOfPosts['_id'];
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
    return idOfPost;
  }

  /* final List<TweetModel> Tweets = [
    /* TweetModel(
      name: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 7,
      isCommented: true,
      isLiked: true,
      isReTweet: true,
      loves: 9,
      retweets: 15,
    ),
    TweetModel(
      name: " lord",
      tweetmessg: "my name is mohamed",
      twitterHandle: "@lxrd",
      time: "3h",
      date: DateTime.now(),
      comments: 5,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 2,
      retweets: 22,
    ),
    TweetModel(
      name: " hassan",
      tweetmessg: "here is my first tweet",
      twitterHandle: "@hassan",
      time: "3h",
      date: DateTime.now(),
      comments: 2,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 13,
      retweets: 0,
    ),
    TweetModel(
      name: " Gemy",
      tweetmessg: "we Don't need memories ",
      twitterHandle: "@gemmmy",
      time: "7h",
      date: DateTime.now(),
      comments: 9,
      isCommented: false,
      isLiked: false,
      isReTweet: true,
      loves: 0,
      retweets: 9,
    ),
    TweetModel(
      name: " Eren",
      tweetmessg: "Keep moving forward all the time",
      twitterHandle: "@Eren00",
      time: "2h",
      date: DateTime.now(),
      comments: 3,
      isCommented: false,
      isLiked: true,
      isReTweet: false,
      loves: 7,
      retweets: 8,
    ),
    TweetModel(
      name: " Ammar",
      tweetmessg: "my name is ammar",
      twitterHandle: "@Ammar1",
      time: "7h",
      date: DateTime.now(),
      comments: 1,
      isCommented: false,
      isLiked: true,
      isReTweet: true,
      loves: 9,
      retweets: 15,
    ),
    TweetModel(
      name: " lord",
      tweetmessg: "my name is mohamed",
      twitterHandle: "@lxrd",
      time: "3h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 2,
      retweets: 22,
    ),
    TweetModel(
      name: " hassan",
      tweetmessg: "here is my first tweet",
      twitterHandle: "@hassan",
      time: "3h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: 13,
      retweets: 0,
    ),
    TweetModel(
      name: " Gemy",
      tweetmessg: "we Don't need memories ",
      twitterHandle: "@gemmmy",
      time: "7h",
      date: DateTime.now(),
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: true,
      loves: 0,
      retweets: 9,
    ),
    TweetModel(
      name: " Eren",
      tweetmessg: "Keep moving forward all the time",
      twitterHandle: "@Eren00",
      time: "2h",
      date: DateTime.now(),
      comments: 23,
      isCommented: false,
      isLiked: true,
      isReTweet: false,
      loves: 7,
      retweets: 8,
    ), */
  ];
 */

  void scrollUp() {
    final double start = 0;
    scrollController.animateTo(start,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  Future addPostPage() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Add Tweet',
          ),
          content: Container(
            height: 225,
            width: 550,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: messgController,
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //color: Colors.amberAccent,
                    height: 150,
                    child: addedimage != null
                        ? Image.file(addedimage)
                        : SizedBox(height: 1),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            InkWell(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: FaIcon(
                        FontAwesomeIcons.camera,
                        size: 18,
                      ),
                    ),
                    // TextSpan(
                    //   text: ' Image',
                    //   style: TextStyle(
                    //     color: Colors.lightBlue,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              onTap: () {
                pickImage(ImageSource.camera);
              },
              onLongPress: () {
                showModalBottomSheet(
                  clipBehavior: Clip.antiAlias,
                  context: context,
                  builder: (context) => Container(
                    height: 127,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text('Camera'),
                          onTap: () =>
                              Navigator.of(context).pop(ImageSource.camera),
                        ),
                        ListTile(
                          leading: Icon(Icons.image),
                          title: Text('Gallery'),
                          onTap: () =>
                              Navigator.of(context).pop(ImageSource.gallery),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: 1,
            ),
            /* TextButton(
              onPressed: () {
                addPostt(
                  messgController.text,
                  '',
                );
              },
              child: Text(
                'Image',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
            ), */
            //Icon(Icons.image,),
            InkWell(
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: FaIcon(
                        FontAwesomeIcons.solidImage,
                        size: 18,
                      ),
                    ),
                    // TextSpan(
                    //   text: ' Image',
                    //   style: TextStyle(
                    //     color: Colors.lightBlue,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              onTap: () {
                pickImage(ImageSource.gallery);
              },
            ),
            TextButton(
              key: Key('Add_post'),
              onPressed: () {
                addPostt(
                  messgController.text,
                  addedimage.toString(),
                );
                Navigator.pop(context);
                messgController.clear();
                addedimage.delete();
              },
              child: Text(
                'Tweet',
                style: TextStyle(
                  color: Colors.lightBlue,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );

/* PostsIntegeration(String username, String name, String token) async {
    Map data = {'data': email, 'password': password};
    //var jsonData = null;
    Map mapResponse;
    Map dataResponse;
    String nameResponse;
    String userResponse;
    String idResponse;

    var response = await http
        .post(Uri.parse("http://twi-jay.me:8080/auth/signin"), body: data);
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      dataResponse = mapResponse;
      nameResponse = mapResponse['user']['name'];
      userResponse = mapResponse['user']['username'];
      idResponse = mapResponse['user']['_id'];
      print('tez 3ez 7mra');
      print(nameResponse);
      token = dataResponse["accessToken"];

      setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          print('nooooooooooo');
          print(token);
          //print(dataResponse['user']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => TimelinePage(
                  token: token,
                  nameOfUser: nameResponse,
                  name: userResponse,
                ),
              ),
              (Route<dynamic> route) => false);
          dataResponse = mapResponse;
        },
      );
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  } */

  Widget getTweetBody() {
    return ListView.builder(
      controller: scrollController,
      itemCount: listOfTweets.length,
      itemBuilder: (context, index) {
        return tweetBoxWidgety(listOfTweets[index]); //Text('index $index');
      },
    );
  }

  Widget tweetBoxWidgety(item) {
    var name = item['user']['name'];
    var userName = item['user']['username'];
    var userProfilePic = item['user']['profile_image_url'];
    var tweetMessg = item['tweet']['text'];
    var date = item['tweet']['created_at'];
    var isLoved = item['tweet']['hasImage'];
    var isRetweeted = item['user']['isAdmin'];
    // var isCommented = item['tweet']['date'];
    var imageOfTweet = item['tweet']['imageUrl'];
    var hasImageTweet = item['tweet']['hasImage'];
    var countOfLoves = item['tweet']['favorites'].length;
    var countOfReteweeted = item['tweet']['retweetUsers'].length;
    var countOfComments = item['user']['__v'];
    var idOfTweet = item['tweet']['_id'];
    var listOfLove = item['tweet']['favorites'];
    var listOfRetweet = item['tweet']['retweetUsers'];
    var lovvvve = [];
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
    /* print(name);
    for (var i in listOfLove) {
      lovvvve.add(i == userdata.token);
    }
    print(lovvvve);
    print(lovvvve); */
    /* print('here is the pictures');
    print(userdata.profileImage);
    print(userdata.profileImage.toString()); */
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
                CircleAvatar(
                  backgroundImage: NetworkImage(userProfilePic != null
                      ? BaseURL + '/' + userProfilePic.toString()
                      : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                  radius: 20,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "${name} ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "${userName} . ",
                  style: TextStyle(fontSize: 18),
                  softWrap: true,
                ),
                Flexible(
                  child: Text(
                    //heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                    "${(dateFormated).toString()}",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  tweetMessg,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          /* Container(
            height: 170,
            child: hasImageTweet
                ? Image.network(
                    (imageOfTweet.length != 0)
                        ? imageOfTweet[0].toString()
                        : 'https://www.whatsappprofiledpimages.com/wp-content/uploads/2021/11/free-Whatsapp-Dp-Boys-Stylish-Girls-Cute-Images-pics.jpg',
                  )
                : SizedBox(
                    height: 1,
                  ),
          ), */
          /* Text(
            !hasImageTweet
                ? "no image , no array "
                : !(imageOfTweet == null)
                    ? "${imageOfTweet[0].toString()} "
                    : "should be error here ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
          ), */
          /*  Container(
            child: !hasImageTweet
                ? SizedBox()
                : (imageOfTweet[0].toString() == 'any')
                    ? SizedBox()
                    : Image.network(imageOfTweet[0].toString()),
          ), */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: FaIcon(
                            FontAwesomeIcons.bookmark,
                            size: 17,
                          ),
                        ),
                        TextSpan(text: '  ${countOfComments}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  BookmarksPage.addBookmark(userdata.token, idOfTweet);
                  //addComment();
                },
              ),
              InkWell(
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: listOfRetweet.length == 0
                              ? FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 17,
                                )
                              : listOfRetweet[listOfRetweet.length - 1] ==
                                      userdata.idUser
                                  ? FaIcon(
                                      FontAwesomeIcons.retweet,
                                      size: 17,
                                      color: Colors.green,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.retweet,
                                      size: 17,
                                    ),
                        ),
                        TextSpan(text: '  ${countOfReteweeted}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    isRetweeted = false;
                    print('this is length of retweets');
                    print(listOfRetweet.length);
                    for (int i = 0; i < listOfRetweet.length; i++) {
                      if (userdata.idUser == listOfRetweet[i]) {
                        isRetweeted = true;
                        removeReTweetIntegeration(idOfTweet, userdata.token);
                        break;
                      }
                    }

                    if (isRetweeted == false) {
                      addReTweetIntegeration(idOfTweet, userdata.token);
                      //isLoved = true;
                    }
                    /* if (isRetweeted == false) {
                      isRetweeted = true;
                      countOfReteweeted += 1;
                    } else {
                      isRetweeted = false;
                      countOfReteweeted -= 1;
                    } */
                  });
                },
              ),
              //showLoveIntegeration(idOfTweet, userdata.token, isLoved),
              InkWell(
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                          child: countOfLoves == 0
                              ? FaIcon(
                                  FontAwesomeIcons.heart,
                                  size: 17,
                                )
                              : listOfLove[listOfLove.length - 1] ==
                                      userdata.idUser
                                  ? FaIcon(
                                      FontAwesomeIcons.solidHeart,
                                      size: 17,
                                      color: Colors.redAccent,
                                    )
                                  : FaIcon(
                                      FontAwesomeIcons.heart,
                                      size: 17,
                                    )),
                      TextSpan(text: '  ${countOfLoves}')
                    ],
                  ),
                ),
                onTap: () {
                  isLoved = false;
                  for (int i = 0; i < listOfLove.length; i++) {
                    if (userdata.idUser == listOfLove[i]) {
                      isLoved = true;
                      removeLikeIntegeration(idOfTweet, userdata.token);
                      break;
                    }
                  }

                  if (isLoved == false) {
                    addLikeIntegeration(idOfTweet, userdata.token);
                    //isLoved = true;
                  }

                  /* setState(() {
                    if (isLoved == false) {
                      isLoved = true;
                      countOfLoves += 1;
                    } else {
                      isLoved = false;
                      countOfLoves -= 1;
                    }
                  }); */
                }, //function,
              )
            ],
          ),
          GreyLineSeperator(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //// print(widget.token);
    //print('we r in timeline');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 1,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          // scaffoldkey.currentState?.openDrawer();
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userdata.profileImage != null
                    ? userdata.profileImage
                    : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                radius: 20,
              ),
            ),
            onTap: () {
              scaffoldkey.currentState?.openDrawer();
            },
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(),
            IconButton(
              onPressed: () {
                scrollUp();
              },
              icon: Image.asset(
                "assests/images/FinalLogo.png",
                scale: 0.5,
              ),
              iconSize: 55.0,
              // color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.star,
              ),
              iconSize: 20.0,
            ),
          ]),
        ),
        key: scaffoldkey,
        body:
            // SingleChildScrollView(
            //   controller: scrollController,
            //   child: Column(
            //     children: [
            //       Text('zh2ttttttttttttttttt'),
            //       tweetBoxWidgety(),
            //     ],
            //   ),
            // ),
            FutureBuilder<String>(
                future: countFuture,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    idOfPost = snapshot.data;
                    getTweet(userdata.token);
                    //return SingleChildScrollView(child: TweetBoxWidgety());
                    return getTweetBody();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
        drawer: SideMenu(),
        // bottomNavigationBar: MaterialYou(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            addPostPage();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future addComment() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Your comment',
          ),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Enter your comment",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('submit'),
            ),
          ],
        ),
      );

  void addPostt(String post, String imageGif) {
    /* final newPost = TweetModel(
      tweetmessg: post,
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: txamount,
      retweets: 0,
      name: userdata.name,
      date: DateTime.now(),
      twitterHandle: userdata.username,
      time: '1min',
    ); */
    addTweetIntegeration(post, userdata.token, imageGif);
    setState(() {
      //Tweets.add(newPost);
    });
  }

  addTweetIntegeration(String message, String token, String imageGif) async {
    Map data;
    print(imageGif);
    if (imageGif == null) {
      print('we r in if');
      Map data = {
        "text": message,
        "source": '',
        "mention": " ",
        "imageUrl": "",
      };
    } else {
      print('we r in else');
      Map data = {
        "text": message,
        "source": '',
        "mention": " ",
        "imageUrl": imageGif,
      };
    }

    //const String BaseURL = "http://twi-jay.me:8080";
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/update"),
      body: data,
      headers: {
        'x-access-token': token,
      },
    );
    //Map dataResponse = json.decode(response.body);
    print('response code');
    print(response.statusCode);

    if (response.statusCode == 200) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(userdata.token, token);

      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  addLikeIntegeration(String idOfTweetpassed, String token) async {
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/favorites/create/${idOfTweetpassed}"),
      headers: {
        'x-access-token': token,
      },
    );
    if (response.statusCode == 200) {
      print('love will increase by +++++1');
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  removeLikeIntegeration(String idOfTweetpassed, String token) async {
    //const String BaseURL = "http://twi-jay.me:8080";
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/favorites/destroy/${idOfTweetpassed}"),
      // body: data,
      headers: {
        'x-access-token': token,
      },
    );

    if (response.statusCode == 200) {
      print('love will decrease by ------1');
      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  addReTweetIntegeration(String idOfTweetpassed, String token) async {
    //const String BaseURL = "http://twi-jay.me:8080";
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/retweet/${idOfTweetpassed}"),
      // body: data,
      headers: {
        'x-access-token': token,
      },
    );

    //Map dataResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  removeReTweetIntegeration(String idOfTweetpassed, String token) async {
    //const String BaseURL = "http://twi-jay.me:8080";
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/unretweet/${idOfTweetpassed}"),
      // body: data,
      headers: {
        'x-access-token': token,
      },
    );

    if (response.statusCode == 200) {
      print('horray by reverse');
      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  showLoveIntegeration(
      String idOfTweetpassed, String token, bool isLikedPassed) async {
    print('we r in show love');
    Map data = {
      'isLiked': isLikedPassed = true,
    };
    final response = await http.post(
      Uri.parse("$BaseURL/tweets/show/${idOfTweetpassed}"),
      body: data,
      headers: {
        'x-access-token': token,
      },
    );

    if (response.statusCode == 200) {
      print('love toggle');
      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  showReetweetedIntegeration(
      String idOfTweetpassed, String token, bool isRetweetedPassed) async {
    Map data = {
      'isRetweeted': isRetweetedPassed,
    };
    final response = await http.post(
      Uri.parse("$BaseURL/user/show/${idOfTweetpassed}"),
      body: data,
      headers: {
        'x-access-token': token,
      },
    );

    if (response.statusCode == 200) {
      print('retweet toggle');
      /*  setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TimelinePage()),
              (Route<dynamic> route) => false);
        },
      ); */

    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }

  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );
      if (image == null) return;
      //return image;
      List<Object> garbage;
      final imagePath = File(image.path);
      setState(() {
        this.addedimage = imagePath;
      });

      print('this is the garbage');
      print(garbage);
      print('this is the image path');
      print(imagePath);
      print('this is the image ');
      print(image);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  /* Future pickImageSelfi() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  } */

}
