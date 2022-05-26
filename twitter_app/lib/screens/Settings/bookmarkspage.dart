import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../API/userdata.dart';
import '../../components/greyLine_seperator.dart';

class BookmarksPage extends StatefulWidget {
  BookmarksPage({Key key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();

  static addBookmark(token, idOfTweetpassed) async {
    var response = await http.put(
      Uri.parse(
        ('http://twi-jay.me:8080/bookmarks/add/${idOfTweetpassed}'),
      ),
      headers: {
        'x-access-token': token,
      },
    );

    // print('md5l444444444');
    //print(response.statusCode);
    if (response.statusCode == 200) {
      print("added");
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
}

class _BookmarksPageState extends State<BookmarksPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var listofBookmarks = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (value) {
                if (value == "Remove") {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Clear all Bookmarks?'),
                      content: const Text(
                          'This can"t be undone and you"ll remove all Tweets you"ve added to your Bookmarks'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                            onPressed: () {
                              RemoveAllBookmarks(userdata.token);
                              print("clicked");
                              Navigator.pop(context, 'Clear');
                            },
                            child: Text("Clear")),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (conetxt) => [
                PopupMenuItem(
                  key: Key('Clear_all'),
                  value: "Remove",
                  child: Text('Clear all bookmarks'),
                ),
              ],
            ),
          ],
          toolbarHeight: 50,
          leading: IconButton(
            key: Key('arrow_back2'),
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmarks",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
        body: FutureBuilder<String>(
            future: countFuture,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                idOfPost = snapshot.data;
                getBookmarks(userdata.token);
                //return SingleChildScrollView(child: TweetBoxWidgety());
                return getTweetBody();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
      ),
    );
  }

  Future RemoveAllBookmarks(String token) async {
    final response = await http.delete(
      Uri.parse(userdata.BaseURL + "/bookmarks/removeAll"),
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

  RemoveBookmark(String idOfTweetpassed, String token) async {
    final response = await http.delete(
      Uri.parse(userdata.BaseURL + "/bookmarks/remove/${idOfTweetpassed}"),
      headers: {
        'x-access-token': token,
      },
    );
    if (response.statusCode == 200) {
      print('love will increase by +++++2');
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

  getTweet(tokenpassed) async {
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

  getBookmarks(tokenpassed) async {
    //await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.parse(
        ('http://twi-jay.me:8080/bookmarks/get'),
      ),
      headers: {
        'x-access-token': tokenpassed,
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      //print(items);
      //List info = items["bookmarks"];
      List info = items["bookmarks"];
      //print(info);
      // var bookmarkitems = info[0];
      // print(bookmarkitems);
      print(info);
      setState(
        () {
          listofBookmarks = info;
        },
      );
    } else {
      setState(
        () {
          print('take care cause the list of Tweets is empty');
          listofBookmarks = [];
        },
      );
    }
  }

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

  Widget getTweetBody() {
    return ListView.builder(
      itemCount: listofBookmarks.length,
      itemBuilder: (context, index) {
        return tweetBoxWidgety(listofBookmarks[index]); //Text('index $index');
      },
    );
  }

  Widget tweetBoxWidgety(tweetitem) {
    //var name = useritem['user']['name'];
    //var userName = useritem['user']['username'];
    //var userProfilePic = useritem['url'];
    print("hereeee");
    var tweetMessg = tweetitem['text'];

    var date = tweetitem['created_at'];
    var isLoved = tweetitem['hasImage'];
    //var isRetweeted = useritem['user']['isAdmin'];
    // var isCommented = item['tweet']['date'];
    var imageOfTweet = tweetitem['imageUrl'];
    var hasImageTweet = tweetitem['hasImage'];
    var countOfLoves = tweetitem['favorites'].length;
    var countOfReteweeted = tweetitem['retweetUsers'].length;
    //var countOfComments = useritem['user']['__v'];
    var idOfTweet = tweetitem['_id'];
    var listOfLove = tweetitem['favorites'];
    var listOfRetweet = tweetitem['retweetUsers'];

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
    print("here");
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
                  backgroundImage: NetworkImage(false
                      ? toString()
                      : 'https://i.pinimg.com/custom_covers/222x/85498161615209203_1636332751.jpg'),
                  radius: 20,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "{name} ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "{userName} . ",
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
                        TextSpan(text: '  {countOfComments}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  //addComment();
                },
              ),
              InkWell(
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: false
                              ? FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 17,
                                  color: Colors.green,
                                )
                              : FaIcon(
                                  FontAwesomeIcons.retweet,
                                  size: 17,
                                  //color: Colors.green,
                                ),
                        ),
                        TextSpan(text: '  ${countOfReteweeted}'),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    //  isRetweeted = false;
                    print('this is length of retweets');
                    print(listOfRetweet.length);
                    for (int i = 0; i < listOfRetweet.length; i++) {
                      if (userdata.idUser == listOfRetweet[i]) {
                        // isRetweeted = true;
                        removeReTweetIntegeration(idOfTweet, userdata.token);

                        break;
                      }
                    }

                    // if (isRetweeted == false) {
                    //   addReTweetIntegeration(idOfTweet, userdata.token);
                    //   //isLoved = true;
                    // }
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
              InkWell(
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: isLoved
                            ? FaIcon(
                                FontAwesomeIcons.solidHeart,
                                size: 17,
                                color: Colors.redAccent,
                              )
                            : FaIcon(
                                FontAwesomeIcons.heart,
                                size: 17,
                              ),
                      ),
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
    print('did I enter here');
    if (response.statusCode == 200) {
      print('horray');
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
    Map data = {
      'isLiked': isLikedPassed,
    };
    final response = await http.post(
      Uri.parse("$BaseURL/user/show/${idOfTweetpassed}"),
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
    //const String BaseURL = "http://twi-jay.me:8080";
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
}
