import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnPost(String postText);

class AddPost extends StatefulWidget {
  final OnPost onPost;
  AddPost(this.onPost);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _postTextCtrl;

  @override
  void initState() {
    super.initState();
    _postTextCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          elevation: 1.0,
          iconTheme: IconThemeData(color: Color(0xFF165ACE)),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Hello Fareed,", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontSize: 28,
                  fontStyle: FontStyle.italic)
              )
            ]
          )
      ),
      body: Container(
        child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        controller: _postTextCtrl,
                        textAlign: TextAlign.left,
                        maxLines: 8,
                        decoration: InputDecoration(hintText: "Hello Pakacademy ...",
                            contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20)
                        ),
                        style: TextStyle(
                            color:Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 25,
                            fontStyle: FontStyle.italic
                        )
                    )
                  )
                ]
              ),
              Container(
                  height: MediaQuery.of(context).size.height-400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        child:
                        RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                            color: Color(0xFF165ACE),
                            onPressed: () {
                              widget.onPost(_postTextCtrl.text);
                              Navigator.of(context).pop();
                              _postTextCtrl.clear();
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Write Post', style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 22,
                                    fontStyle: FontStyle.italic
                                    )
                                  ),
                                  Icon(Icons.add, size: 30, color: Colors.white)
                                ]
                              )
                        ),
                        width: MediaQuery.of(context).size.width-70,
                      )
                    ]
                )
              )
            ]
        )
      )
    );
  }
}
