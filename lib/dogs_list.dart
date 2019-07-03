import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dog.dart';
import 'mid_list_view.dart';

class DogsList extends StatelessWidget {

  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));


  Widget _buildListView(List<Widget> categories) {

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {

    var categories = <MidListView>[];

    for (var i = 0; i < initialDoggos.length; i++) {
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