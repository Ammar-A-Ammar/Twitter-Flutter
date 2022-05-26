import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

Padding changetheme(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => CupertinoSwitch(
              activeColor: Colors.blueAccent,
              trackColor: Colors.grey,
              value: notifier.darkTheme,
              onChanged: (val) {
                notifier.toggleTheme();
              },
            ),
          ),
        ),
      ],
    ),
  );
}
