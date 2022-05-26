//import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime createdDate;

  @HiveField(2)
  String passwordPassed;

  //void add(Transaction transaction) {}
}
