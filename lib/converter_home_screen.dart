import 'package:flutter/material.dart';

import 'custom_tile_list.dart';

class ConverterHomeScreen extends StatelessWidget {

  final Color color;
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _iconsName = <IconData> [
    Icons.linear_scale,
    Icons.check_box_outline_blank,
    Icons.volume_mute,
    Icons.line_weight,
    Icons.timer,
    Icons.mood_bad,
    Icons.autorenew,
    Icons.attach_money
  ];

  const ConverterHomeScreen(
      {Key key,
       this.color})
       : assert(color != null);




  @override
  Widget build(BuildContext context) {

    final categories = <CustomTileList>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(CustomTileList(
        text: _categoryNames[i],
        color: _baseColors[i],
        icon: _iconsName[i],
      ));
    }

    Widget _buildListView(List<Widget> categories) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      );
    }

    final listView = Container(
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildListView(categories)
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: color,
        title: Text(
            "Unit Converter",
            style: TextStyle(color: Colors.black,fontSize: 30.0),
        ),
        centerTitle: true,
      ),
      body: listView,
    );
  }
}