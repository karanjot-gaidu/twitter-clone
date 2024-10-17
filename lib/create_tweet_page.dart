import 'package:flutter/material.dart';
import 'package:twitter/tweet_model.dart';


class CreateTweetPage extends StatefulWidget {
  const CreateTweetPage({Key? key}) : super(key: key);

  @override
  _CreateTweetPageState createState() => _CreateTweetPageState();
}

class _CreateTweetPageState extends State<CreateTweetPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userLongNameController = TextEditingController();
  final TextEditingController _userShortNameController = TextEditingController();
  final TextEditingController _tweetTextController = TextEditingController();
  final TextEditingController _imageURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Tweet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userLongNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _userShortNameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tweetTextController,
                decoration: const InputDecoration(labelText: 'Tweet Text'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your tweet';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageURLController,
                decoration: const InputDecoration(labelText: 'Image URL (optional)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final tweet = Tweet(
                        profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
                        userShortName: _userShortNameController.text,
                        userLongName: _userLongNameController.text,
                        time: DateTime.now(),
                        description: _tweetTextController.text,
                        imageURL: (_imageURLController.text != "") ? _imageURLController.text : null,
                        numComments: 0,
                        numRetweets: 0,
                        numLikes: 0,
                    );
                    Navigator.pop(context, tweet);
                  }
                },
                child: const Text('Post Tweet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
