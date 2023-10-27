import 'package:flutter/material.dart';
import 'package:gmail/widgets/custom_app_bar.dart';
import 'package:gmail/widgets/custom_text_widget.dart';

class LanguageAndPhone extends StatefulWidget {
  @override
  _LanguageAndPhoneState createState() => _LanguageAndPhoneState();
}

class _LanguageAndPhoneState extends State<LanguageAndPhone> {
  // List of languages
  final List<String> languages = ["English", "Spanish", "French", "German", "Chinese"];
  final List<String> country = ["America", "Ireland", "India", "Germany", "China"];

  String? selectedCountry; // Initialize the selected language as nullable
  String? selectedLanguage; // Initialize the selected language as nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(title: "Select a Language:"),
                DropdownButton<String>(
                  hint: Text("Select a Language:"), // Add the hint text here
                  value: selectedLanguage,
                  items: languages.map((String language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // When the user selects a language
                    setState(() {
                      selectedLanguage = newValue;
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(title: "Select a Language:"),
                DropdownButton<String>(
                  hint: Text("Default Country Code:"), // Add the hint text here
                  value: selectedCountry,
                  items: country.map((String language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // When the user selects a language
                    setState(() {
                      selectedCountry = newValue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
