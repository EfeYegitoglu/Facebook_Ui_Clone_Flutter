import 'package:facebook_ui_clone/Models/Models.dart';
import 'package:meta/meta.dart';

class Story{
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story({this.user,this.imageUrl,this.isViewed});
}