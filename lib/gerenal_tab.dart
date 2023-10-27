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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: CustomAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: screenWidth > 600 ? 60 : 30),
          GeneralTopicItem("Language & Phone numbers", () {
            // Open a dialog displaying the LanguageAndPhoneScreen content
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return LanguageAndPhoneScreenDialog(screenWidth: screenWidth);
              },
            );
          }),
          SizedBox(height: screenWidth > 600 ? 60 : 30),
          GeneralTopicItem("Default text", () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DefaultTextDialog(screenWidth: screenWidth);
              },
            );
          }),
          SizedBox(height: screenWidth > 600 ? 60 : 30),
          GeneralTopicItem("Stars", () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StarScreenDialog(screenWidth: screenWidth);
              },
            );
          }),
          SizedBox(height: screenWidth > 600 ? 60 : 30),
          GeneralTopicItem("Signature", () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SignatureDialog(screenWidth: screenWidth);
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
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth - 60;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(screenWidth > 600 ? 60 : 30),
      child: ListTile(
        title: CustomText(title: topic),
        trailing: Icon(Icons.arrow_forward),
        onTap: onPressed, // Call the onPressed callback when tapped
      ),
    );
  }
}

class LanguageAndPhoneScreenDialog extends StatelessWidget {
  final double screenWidth;

  LanguageAndPhoneScreenDialog({required this.screenWidth});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Language & Phone numbers"),
      content: Container(
        width: screenWidth > 600 ? 600 : screenWidth - 40,
        height: 190,
        child: LanguageAndPhone(),
      ),
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
  final double screenWidth;

  DefaultTextDialog({required this.screenWidth});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Default text"),
      content: Container(
        width: 400,
        height: 190,
        child: DefaultText(),
      ),
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
  final double screenWidth;

  StarScreenDialog({required this.screenWidth});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Stars"),
      content: Container(
        width: screenWidth > 600 ? 600 : screenWidth - 40,
        height: 250,
        child: StarsScreen(),
      ),
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
  final double screenWidth;

  SignatureDialog({required this.screenWidth});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Signature"),
      content: Container(
        width: screenWidth > 600 ? 600 : screenWidth - 40,
        height: 300,
        child: SignatureScreen(),
      ),
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
