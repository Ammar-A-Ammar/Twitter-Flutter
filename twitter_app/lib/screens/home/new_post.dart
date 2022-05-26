import 'package:flutter/material.dart';
import 'package:twitter_app/API/userdata.dart';
import '../../model/tweet_model.dart';
import 'package:get/get.dart';

class postController extends GetxController {
  void addPostt(String post, int txamount) {
    final newPost = TweetModel(
      tweetmessg: post,
      comments: 0,
      isCommented: false,
      isLiked: false,
      isReTweet: false,
      loves: txamount,
      retweets: 0,
      name: userdata.name,
      date: DateTime.now(),
      twitterHandle: userdata.idUser,
      time: '1min',
    );

    update();
    // Tweets.add(newPost);
  }
}
