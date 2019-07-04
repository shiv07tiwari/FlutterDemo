import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dog.dart';
import 'mid_list_view.dart';

class DogsList extends StatelessWidget {

  final List<Dog> initialDoggos;
  DogsList(this.initialDoggos);

  Widget _buildListView(List<Widget> categories) {

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  void addDog(Dog dog) {
    print("New Dog ${dog.name}");
    initialDoggos.add(dog);
    print("NNN : $initialDoggos");
  }

  @override
  Widget build(BuildContext context) {

    print("List build");

    var categories = <MidListView>[];

    for (var i = 0; i < initialDoggos.length; i++) {
      print("count = $i");
      categories.add(MidListView(initialDoggos[i]));
    }

    final listView = Container(
        color: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: _buildListView(categories)
    );

    return listView;
  }

}