import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/Config/Palette.dart';
import 'package:facebook_ui_clone/Models/Models.dart';
import 'package:facebook_ui_clone/Widgets/ProfileAvatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;

  final List<Story> stories;

  const Stories({Key key, @required this.currentUser, @required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                story: story,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;


   const _StoryCard(
      {Key key,
      this.isAddStory = false,
      this.currentUser,
      this.story,})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                    onPressed: () {
                      print("Add Story");
                    },
                  ),
                )
              : ProfileAvatar(
                imageUrl: this.story.user.imageUrl,
                hasBorder: true,
              ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(isAddStory ? "Hikaye Ekle" :story.user.name,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),maxLines: 2,
          overflow: TextOverflow.ellipsis,),
        )
      ],
    );
  }
}
