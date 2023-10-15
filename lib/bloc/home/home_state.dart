import 'package:al_qamar/models/article.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class CompleteHomeState extends HomeState {
  final List<Article> articleList;
  CompleteHomeState(this.articleList);
}

class FailHomeState extends HomeState {
  final String errorMessage;
  FailHomeState(this.errorMessage);
}
