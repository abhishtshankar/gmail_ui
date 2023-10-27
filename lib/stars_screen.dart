import 'package:flutter/material.dart';

class StarsScreen extends StatefulWidget {
  @override
  _StarsScreenState createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
  List<Widget> inUseStars = [];
  List<Widget> notInUseStars = [
    DraggableStar(color: Colors.green),
    DraggableStar(color: Colors.pink),
    DraggableStar(color: Colors.blue),
    DraggableStar(color: Colors.teal),
    DraggableStar(color: Colors.cyan),
    DraggableStar(color: Colors.purpleAccent),
    DraggableStar(color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Drag the stars between the lists. ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                      "The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Presets :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " 1 Star, 4 Star, All Stars",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.lightBlue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("In Use :", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: DragTarget<DraggableStar>(
                      onAccept: (star) {
                        setState(() {
                          inUseStars.add(star);
                          notInUseStars.remove(star);
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Row(
                          children: inUseStars,
                        );
                      },
                    ),
                  ),
                ],
              ),
              // "Not In Use" section with DragTarget
              Row(
                children: [
                  Text("Not In Use :", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: DragTarget<DraggableStar>(
                      onAccept: (star) {
                        setState(() {
                          notInUseStars.add(star);
                          inUseStars.remove(star);
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Row(
                          children: notInUseStars,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DraggableStar extends StatelessWidget {
  final Color color;

  DraggableStar({required this.color});

  @override
  Widget build(BuildContext context) {
    return Draggable<DraggableStar>(
      data: this,
      child: Icon(Icons.star, color: color),
      feedback: Icon(Icons.star, color: color, size: 40),
      childWhenDragging: Icon(Icons.star_border, color: color),
    );
  }
}
