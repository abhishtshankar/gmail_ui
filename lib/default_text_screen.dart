import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatefulWidget {
  @override
  _DefaultTextState createState() => _DefaultTextState();
}

class _DefaultTextState extends State<DefaultText> {
  final List<String> fontNames = ['Poppins', 'Roboto', 'Open Sans'];
  final List<String> textSizes = ['Small', 'Huge', 'Large'];

  String? selectedFont;
  String? selectedSize;
  double textSize = 16.0; // Default text size
  Color textColor = Colors.black; // Default text color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  SizedBox(height: 110,),
                  DropdownButton<String>(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Font:"),
                    ),
                    value: selectedFont,
                    items: fontNames.map((String fontName) {
                      return DropdownMenuItem<String>(
                        value: fontName,
                        child: Text(fontName),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFont = newValue;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Size:"),
                    ),
                    value: selectedSize,
                    items: textSizes.map((String size) {
                      return DropdownMenuItem<String>(
                        value: size,
                        child: Text(size),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedSize = newValue;
                        if (selectedSize == 'Small') {
                          textSize = 12.0;
                        } else if (selectedSize == 'Huge') {
                          textSize = 24.0;
                        } else {
                          textSize = 16.0;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  DropdownButton<Color>(
                    hint: Text("A"),
                    value: textColor,
                    items: [
                      DropdownMenuItem(
                        value: Colors.black,
                        child: Text("Black"),
                      ),
                      DropdownMenuItem(
                        value: Colors.red,
                        child: Text("Red"),
                      ),
                      DropdownMenuItem(
                        value: Colors.blue,
                        child: Text("Blue"),
                      ),
                      DropdownMenuItem(
                        value: Colors.green,
                        child: Text("Green"),
                      ),
                      // Add more color options as needed
                    ],
                    onChanged: (Color? newValue) {
                      setState(() {
                        textColor = newValue ?? Colors.black;
                      });
                    },
                  ),
                ],
              ),
            ),
            Text(
              "Sample Text",
              style: selectedFont != null
                  ? GoogleFonts.getFont(selectedFont!)?.copyWith(
                fontSize: textSize,
                color: textColor,
              )
                  : TextStyle(fontSize: textSize, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
