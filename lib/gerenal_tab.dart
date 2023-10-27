import 'package:flutter/material.dart';
import 'package:gmail/default_text_screen.dart';
import 'package:gmail/language_phone_screen.dart';
import 'package:gmail/signature_screen.dart';
import 'package:gmail/stars_screen.dart';
import 'package:gmail/widgets/custom_app_bar.dart';
import 'package:gmail/widgets/custom_text_widget.dart';

class GeneralTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          GeneralTopicItem("Language & Phone numbers", () {
            // Open a dialog displaying the LanguageAndPhoneScreen content
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return LanguageAndPhoneScreenDialog();
              },
            );
          }),
          SizedBox(height: 30),
          GeneralTopicItem("Default text" , (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DefaultTextDialog();
              },
            );
          }),
          SizedBox(height: 30),
          GeneralTopicItem("Stars", (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StarScreenDialog();
              },
            );
          }),
          SizedBox(height: 30),
          GeneralTopicItem("Signature", (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SignatureDialog();
              },
            );
          }),
        ],
      ),
    );
  }
}

class GeneralTopicItem extends StatelessWidget {
  final String topic;
  final VoidCallback onPressed;

  GeneralTopicItem(this.topic, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(30),
      child: ListTile(
        title: CustomText(title: topic),
        trailing: Icon(Icons.arrow_forward),
        onTap: onPressed, // Call the onPressed callback when tapped
      ),
    );
  }
}

class LanguageAndPhoneScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Language & Phone numbers"),
      content: Container(height: 150,child: LanguageAndPhone()), // Replace with the content of your LanguageAndPhoneScreen
      actions: <Widget>[
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}

class DefaultTextDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Default text"),
      content: Container(height: 150,width: 950, child: DefaultText()),
      actions: <Widget>[
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}

class StarScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Stars"),
      content: Container(height: 200,width: 950, child: StarsScreen()),
      actions: <Widget>[
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}

class SignatureDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Signature"),
      content: Container(height: 300,width: 950, child: SignatureScreen()),
      actions: <Widget>[
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}

