import 'package:flutter/material.dart';

import 'dog.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



/// You'll need the context in order for the Navigator to work.
  void submitPup(BuildContext context) {
    // First make sure there is some information in the form.
    // A dog needs a name, but may be location independent,
    // so we'll only abandon the save if there's no name.
    if (nameController.text.isEmpty || locationController.text.isEmpty || descriptionController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Please fill all the details.'),
        ),
      );

    } else {
      // Create a new dog with the information from the form.
      var newDog = Dog(nameController.text, locationController.text,
          descriptionController.text);
      // Pop the page off the route stack and pass the new
      // dog back to wherever this page was created.
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                // Text Field is the basic input widget for Flutter.
                // It comes built in with a ton of great UI and
                // functionality, such as the labelText field you see below.
                child: TextField(
                  //controller: nameController,
                  onChanged: (v){
                    nameController.text = v;
                  },
                    decoration: InputDecoration(
                      labelText: 'Name the Pup',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    onChanged: (v){
                      locationController.text = v;
                    },
                    decoration: InputDecoration(
                      labelText: "Pup's location",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  onChanged: (v){
                    descriptionController.text = v;
                  },
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),

              /// Hack to pass context across various widgets. Wrap it around the builder
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    // The basic Material Design action button.
                    return RaisedButton(
                      // If onPressed is null, the button is disabled
                      // this is my goto temporary callback.
                      onPressed: () => submitPup(context),
                      color: Colors.indigoAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}