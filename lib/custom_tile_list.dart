import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CustomTileList extends StatelessWidget {

  final Color color;
  final String text;
  final IconData icon;

  const CustomTileList({
    key,
    @required this.color,
    @required this.text,
    @required this.icon
  }) : assert(text != null),
        assert(icon != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(100 / 2),
          highlightColor: color,
          splashColor: color,
          onTap: () {
            print("I was tapped ");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    this.icon,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    this.text,
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }

}