
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:core';

/*---------------------- ADD NEW NOTICE ----------------------*/

//To add a new notice
//send all data to server and pass notice title back

final rechargereference =
    Firestore.instance.collection("RechargePlan").getDocuments();

class FormFill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormFillState();
}

class _FormFillState extends State<FormFill>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController talktime = TextEditingController();
  TextEditingController planID = TextEditingController();
  TextEditingController dataPlan = TextEditingController();
  TextEditingController rechargeType = TextEditingController();
  TextEditingController dataPlanTime = TextEditingController();
  TextEditingController messages = TextEditingController();
  TextEditingController validity = TextEditingController();
  TextEditingController validityTime = TextEditingController();

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentFormtype;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  //Game API's
  void Rechargefirebase() {
    DocumentReference documentReference =
        Firestore.instance.document("RechargePlan/" + planID.text);
    var data = {
      "PalanId": planID.text,
      "Talktime": talktime.text,
      "DataPlan": dataPlan.text,
      "Recharge Plan": rechargeType.text,
      "DataPlan Time": dataPlanTime.text,
      "Messages": messages.text,
      "Validity": validity.text,
      "Validity Time": validityTime.text,
    };

    documentReference.setData(data).whenComplete(() {
      print("Recharge Document Added");
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF357DED),
        title: Text('Add Notice'),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'PlanID',
                    ),
                    controller: planID,
                    onSaved: (v) => planID.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'TalkTime ',
                    ),
                    controller: talktime,
                    onSaved: (v) => talktime.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'dataPlan: ',
                    ),
                    controller: dataPlan,
                    onSaved: (v) => dataPlan.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'rechargeType: ',
                    ),
                    controller: rechargeType,
                    onSaved: (v) => rechargeType.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'dataPlanTime: ',
                    ),
                    controller: dataPlanTime,
                    onSaved: (v) => dataPlanTime.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'messages: ',
                    ),
                    controller: messages,
                    onSaved: (v) => messages.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'validity: ',
                    ),
                    controller: validity,
                    onSaved: (v) => validity.text = v,
                  ),
                ),
                Container(
                  height: 100.0,
                  child: TextFormField(
                    keyboardType:
                        TextInputType.text, // Use email input type for emails.
                    decoration: InputDecoration(
                      // hintText: 'Subject',
                      labelText: 'validityTime: ',
                    ),
                    controller: validityTime,
                    onSaved: (v) => validityTime.text = v,
                  ),
                ),
                Container(
                  height: 125.0,
                ),
              ],
            ),
          )),
      floatingActionButton: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // CustomButtonUploadImage(onPressed: () {
          //   setState(() {
          //     tempURL = uploadImage();
          //   });
          // }),
          FloatingActionButton(
            heroTag: 'fabcancel',
            backgroundColor: Colors.red,
            child: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              //no notice added; cancel
              Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        null), //To go back to home page on adding of notice
              );
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          FloatingActionButton(
            heroTag: 'fabdone',
            backgroundColor: Color(0xFF1DC5A3),
            child: Icon(
              Icons.done,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () async {
              Rechargefirebase();
              // if (imageUpload == true) {
              //   imageUpload = false;
              //   Fluttertoast.showToast(
              //       msg: "File Uploading...",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIos: 1,
              //       backgroundColor: Colors.green,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              //   String finalURL = await uploadImage();
              //   print(finalURL);

              //   crudObj.addData({
              //     'type': this._currentFormtype,
              //     'title': this.title.text,
              //     'description': this.description.text,
              //     'date': this.date.toString(),
              //     'image_name': this.file_name,
              //     'downURL': finalURL,
              //   });

              //   Fluttertoast.showToast(
              //       msg: "File Uploaded",
              //       toastLength: Toast.LENGTH_LONG,
              //       gravity: ToastGravity.BOTTOM,
              //       timeInSecForIos: 1,
              //       backgroundColor: Colors.blue,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              //   Navigator.pop(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             HomePage()), //To go back to home page on adding of notice
              //   );
              // } else {
              //   crudObj.addData({
              //     'type': this._currentFormtype,
              //     'title': this.title.text,
              //     'description': this.description.text,
              //     'date': this.date.toString(),
              //     'image_name': this.file_name,
              //     'downURL': null,
              //   });
              Navigator.pop(
                context,
                //To go back to home page on adding of notice
              );
              // }
            },
          ),
        ],
      ),
    );
  }
}

class CustomButtonSelectDate extends StatelessWidget {
  CustomButtonSelectDate({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      fillColor: Colors.blueAccent,
      splashColor: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.date_range,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Select Date",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class CustomButtonImageUpload extends StatelessWidget {
  CustomButtonImageUpload({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      fillColor: Colors.blueAccent,
      splashColor: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.image,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Upload Image",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class CustomButtonUploadImage extends StatelessWidget {
  CustomButtonUploadImage({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      fillColor: Colors.blueAccent,
      splashColor: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "Upload Image(if any)",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
