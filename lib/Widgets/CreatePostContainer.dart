import 'package:facebook_ui_clone/Models/Models.dart';
import 'package:facebook_ui_clone/Widgets/Widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl,),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Ne düşünüyorsun?",
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                    onPressed: () => ("Canlı"),
                    icon: Icon(
                      Icons.video_call_outlined,
                      color: Colors.red,
                    ),
                    label: Text("Canlı")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => ("Fotoğraf"),
                    icon: Icon(
                      Icons.picture_as_pdf_outlined,
                      color: Colors.green,
                    ),
                    label: Text("Fotoğraf")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => ("Oda"),
                    icon: Icon(Icons.video_call,color: Colors.deepPurpleAccent,),
                    label: Text("Oda")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
