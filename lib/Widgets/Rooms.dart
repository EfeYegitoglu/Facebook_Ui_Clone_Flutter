import 'package:facebook_ui_clone/Config/Palette.dart';
import 'package:facebook_ui_clone/Models/Models.dart';
import 'package:facebook_ui_clone/Widgets/ProfileAvatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: CreateRoomButton());
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,),
              child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),);
          }),
    );
  }
}

class CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        print("Oda Butonu Basıldı");
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 2.0, color: Palette.facebookBlue),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0,),
          Text("Oda\nKur"),
        ],
      ),
    );
  }
}
