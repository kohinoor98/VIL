import 'package:flutter/material.dart';
// import 'package:VIL/Bot/Messages.dart';

import 'package:flutter_dialogflow/dialogflow_v2.dart';

// class IdeaChatBot extends StatefulWidget {
//   IdeaChatBot({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _IdeaChatBotState createState() => new _IdeaChatBotState();
// }

// class _IdeaChatBotState extends State<IdeaChatBot> {
//   final List<Facts> messageList = <Facts>[];
//   final TextEditingController _textController = new TextEditingController();

//   Widget _queryInputWidget(BuildContext context) {

//     return Card(
//       margin: EdgeInsets.all(10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
//       child: Padding(
//         padding: const EdgeInsets.only(left:8.0, right: 8),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: TextField(
//                 controller: _textController,
//                 onSubmitted: _submitQuery,
//                 decoration: InputDecoration.collapsed(hintText: "Send a message"),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                   icon: Icon(Icons.send, color: Colors.green[400],),
//                   onPressed: () => _submitQuery(_textController.text)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void agentResponse(query) async {
//     _textController.clear();
//     AuthGoogle authGoogle =
//     await AuthGoogle(fileJson: "assets/BotDialog.json").build();
//     Dialogflow dialogFlow =
//     Dialogflow(authGoogle: authGoogle, language: Language.english);

//     AIResponse response = await dialogFlow.detectIntent(query);
//     Facts message = Facts(
//       text: response.getMessage() ??
//           CardDialogflow(response.getListMessage()[0]).title,
//       name: "Idea Bot",
//       type: false,
//     );
//     setState(() {
//       messageList.insert(0, message);
//     });

//   }

//   void _submitQuery(String text) {
//     if(text.compareTo("")!=0)
//     {
//       _textController.clear();
//       Facts message = new Facts(
//         text: text,
//         name: "User",
//         type: true,
//       );
//       setState(() {
//         print("Why not wrorking \n\n\n\n\n");
//         messageList.insert(0, message);
//       });

//       agentResponse(text);

//     }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black12,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Idea Bot", style: TextStyle(color: Colors.black),),
//         backgroundColor: Colors.yellow,
//         elevation: 0,
//       ),
//       body: Column(children: <Widget>[
//         Flexible(
//             child: ListView.builder(
//               padding: EdgeInsets.all(8.0),
//               reverse: true, //To keep the latest messages at the bottom
//               itemBuilder: (_, int index) => messageList[index],
//               itemCount: messageList.length,
//             )),
//         _queryInputWidget(context),
//       ]),
//     );
//   }
// }

class IdeaChatBot extends StatefulWidget {
  IdeaChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IdeaChatBot createState() => new _IdeaChatBot();
}

class _IdeaChatBot extends State<IdeaChatBot> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/BotDialog.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "JoJo",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Flutter and Dialogflow"),
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(child: new Text('B')),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name, style: Theme.of(context).textTheme.subhead),
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(text),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
            child: new Text(
          this.name[0],
          style: new TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
