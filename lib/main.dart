import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './general_observer.dart';
import './app.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(App());
}
