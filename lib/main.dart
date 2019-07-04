import 'package:flutter/material.dart';
import 'dog.dart';
import 'dogs_list.dart';
import 'new_dog_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      debugShowCheckedModeBanner: false,
      // Make all our text default to white
      // and backgrounds default to dark
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  /// Any time you're pushing a new route and expect that route
/// to return something back to you,
/// you need to use an async function.
/// In this case, the function will create a form page
/// which the user can fill out and submit.
/// On submission, the information in that form page
/// will be passed back to this function.
  Future _showNewDogForm() async {
    // push a new route like you did in the last section
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddDogFormPage();
        },
      ),
    );
    // A null check, to make sure that the user didn't abandon the form.
    if (newDog != null) {
      initialDoggos.add(newDog);
//      setState(() {
//        print("Change");
//      });
    }
  }

  @override
  Widget build(BuildContext context) {

    print("Home Build");
    return Scaffold(
      appBar: AppBar(
        /// Access this widgets properties with 'widget'
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),

      /// Container can be used as a placeholder in your code.
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.4, 0.6, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.red[800],
            Colors.red[600],
            Colors.red[400],
            Colors.red[200],
          ],
        )),
        child: DogsList(initialDoggos),
      ),
    );
  }
}

/// Simple List View
//void main() {
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Demo App',
//      home: ConverterHomeScreen(
//          color : Colors.green[100]
//      ),
//    ),
//  );
//}
/// Contains other files too

/// Counter App
//void main() => runApp(new MyApp());
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'Flutter Home Demo Page'),
//    );
//  }
//}

//
/// This Widget is Stateful,
//// because it's managing the state of the counter.
//
/// class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  // It's being passed in title, you can see above.
//  final String title; // => Flutter Home Demo Page
//
///   Stateful Widgets don't have build methods.
///   They have createState() methods.
//  // Create State returns a class that extends Flutters State class.
///  @override
///  _MyHomePageState createState() => new _MyHomePageState();
//
//// Stateful Widgets are rarely more complicated than this.
//}
//
//
//// This is the state that MyHomePage created.
///class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  // I've left in the comments from the sample app
//  // because they say it better than I could:
//  void _incrementCounter() {
//
//    // Built in Flutter Method.
//    if (mounted) {
///      setState(() {
///         This call to setState tells the Flutter framework that something has
//        // changed in this State, which causes it to rerun the build method below
//        // so that the display can reflect the updated values. If we changed
//        // _counter without calling setState(), then the build method would not be
//        // called again, and so nothing would appear to happen.
//        _counter++;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called,
//    // for instance as done by the _incrementCounter method above.
//
//    // Scaffold is another build in app that gives us a standard
//    // mobile app layout. You'll most likely use this on every page
//    // of your app
//    return new Scaffold(
//      // the bar accross the top of the app
//      appBar: new AppBar(
//        // State classes access properties on their
//        // parent by calling widget.someProperty
//        //  It's easier to think of StatefulWidgets and their corresponding
//        // StateClasses as a single Widget.
//        title: new Text(widget.title),
//      ),
//      body: new Center(
//        // Center is a layout widget. It takes a single child
//        // and positions it in the middle of the parent.
//        child: new Column(
//          // Column is also layout widget. It takes a List of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          //
//          // mainAxisAlignment and crossAxisAlignment should feel very familiar
//          // if you're used to using CSS's Flexbox or Grid.
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              // Text takes a String as it's first argument.
//              // We're passing in the value of the counter
//              // as an interpolated String.
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      // Floating action buttons are special button
//      floatingActionButton: new FloatingActionButton(
///        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ),
//    );
//  }
//}
/// Counter App Ends
