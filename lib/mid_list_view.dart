import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dog.dart';
import 'dog_detail_page.dart';

class MidListView extends StatefulWidget {
  final Dog dog;

  MidListView(this.dog);

  @override
  _MidListViewState createState() {
    return _MidListViewState(this.dog);
  }
}

class _MidListViewState extends State<MidListView> {

  Dog dog;
  String renderUrl;

  _MidListViewState(this.dog);

  /// State classes run this method when the state is created.
  /// You shouldn't do async work in initState.
  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();

    /// setState tells Flutter to rerender anything that's been changed.
    /// setState cannot be async, so we use a variable that can be overwritten
    if (mounted) {
      /// Avoid calling `setState` if the widget is no longer in the widget tree.
      setState(() {
        renderUrl = dog.imageUrl;
        print("Rendered URL : $renderUrl");
      });
    }
  }

  Widget imageDesign() {
    return Container(
      width: 100,
      height: 100,
      // Decoration is a property that lets you style the container.
      // It expects a BoxDecoration.
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            /// A NetworkImage widget is a widget that
            /// takes a URL to an image.
            // ImageProviders (such as NetworkImage) are ideal
            // when your image needs to be loaded or can change.
            // Use the null check to avoid an error.
            image: NetworkImage(renderUrl ?? '')),
      ),
    );
  }

  Widget cardDesign() {
    return Container(
      height: 115,
      width: 290,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
              right: 20
          ),
          child: Column(
            children: <Widget>[
              Text(
                widget.dog.name,
                style: Theme.of(context).textTheme.subhead,
              ),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Text("${widget.dog.rating} / 10",
                      style: Theme.of(context).textTheme.subhead),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: showDetailPage,
      child: Container(
        height: 115.0,

        /// A stack takes children, with a list of widgets.
        child: Stack(
          children: <Widget>[
            // position our dog image, so we can explicitly place it.
            // We'll place it after we've made the card.
            Positioned(
              left: 50.0,
              child: cardDesign(),
            ),
            Positioned(
              top: 7.5,
              child: imageDesign(),
            )
          ],
        ),
      ),
    );
  }

  void showDetailPage() {
    // Navigator.of(context) accesses the current app's navigator.
    // Navigators can 'push' new routes onto the stack,
    // as well as pop routes off the stack.
    //
    // This is the easiest way to build a new page on the fly
    // and pass that page some state from the current page.
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return DogDetailPage(dog);
        },
      ),
    );
  }
}
