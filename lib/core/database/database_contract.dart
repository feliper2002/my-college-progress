import 'package:sqflite/sqflite.dart';

abstract class DatabaseContract {
  Future<Database> connect();
}
