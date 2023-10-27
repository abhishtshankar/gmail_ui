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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text("Font:"),
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text("Size:"),
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
                          textSize = 18.0;
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<Color>(
                    hint: Text("Color:"),
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
                ),
              ],
            ),
            SizedBox(height: 20),
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
