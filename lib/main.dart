import 'package:flutter/material.dart';
import 'create_tweet_page.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Twitter Demo by Karanjot Gaidu'),
    );
  }
}

final TextStyle userIDTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.black.withOpacity(0.5)
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<TweetWidget> _hardcodedTweets = [
    TweetWidget(
      profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
      userShortName: '@NatGeo',
      userLongName: 'National Geographic',
      time: DateTime.now().subtract(const Duration(hours: 4)),
      description:
      'A European jackal dives at a Eurasian Magpie who got too close to the jackal\'s recent catch in this photo by Your Shot Photographer Sergey Zlatkov',
      imageURL:
      'https://images.pexels.com/photos/17473766/pexels-photo-17473766/free-photo-of-a-jackal-on-a-grass-field.jpeg',
      numComments: 120,
      numRetweets: 300,
      numLikes: 450,
    ),
    TweetWidget(
      profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
      userShortName: '@TheRealNASA',
      userLongName: 'NASA',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      description:
      'A stunning view of Earth from space, captured during the latest mission! 🌍✨ #EarthDay',
      imageURL:
      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
      numComments: 250,
      numRetweets: 500,
      numLikes: 750,
    ),
    // Add more hardcoded tweets if necessary
  ];

  final List<TweetWidget> _tweets = [];

  // Method to navigate to CreateTweetPage and await result
  Future<void> _navigateToCreateTweetPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTweetPage()),
    );

    if (result != null) {
      // If result is not null, add it to the list of tweets
      setState(() {
        _tweets.add(TweetWidget(
          profileURL: result.profileURL,
          userShortName: result.userShortName,
          userLongName: result.userLongName,
          time: result.time, // Format as desired
          description: result.description,
          imageURL: result.imageURL,
          numComments: result.numComments,
          numRetweets: result.numRetweets,
          numLikes: result.numLikes,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // const Tweet(),
          ..._hardcodedTweets,
          ..._tweets,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreateTweetPage,
        child: const Icon(Icons.add),
      ),

      // Position the button at the bottom-right
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class TweetEg extends StatelessWidget {
  const TweetEg({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@NatGeo',
          userLongName: 'National Geographic',
          time: DateTime.now().subtract(Duration(hours: 4)),
          description:
          'A European jackal dives at a Eurasian Magpie who got too close to the jackal\'s recent catch in this photo by Your Shot Photographer Sergey Zlatkov',
          imageURL: 'https://images.pexels.com/photos/17473766/pexels-photo-17473766/free-photo-of-a-jackal-on-a-grass-field.jpeg',
          numComments: 120,
          numRetweets: 300,
          numLikes: 450,
        ),

        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@TheRealNASA',
          userLongName: 'NASA',
          time: DateTime.now().subtract(Duration(hours: 2)),
          description: 'A stunning view of Earth from space, captured during the latest mission! 🌍✨ #EarthDay',
          imageURL: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
          numComments: 250,
          numRetweets: 500,
          numLikes: 750,
        ),

        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@TechCrunch',
          userLongName: 'TechCrunch',
          time: DateTime.now().subtract(Duration(hours: 1)),
          description: 'Exciting news in the tech world! A new startup is changing the way we think about AI. 🤖 #TechNews',
          imageURL: 'https://images.pexels.com/photos/3861955/pexels-photo-3861955.jpeg',
          numComments: 150,
          numRetweets: 300,
          numLikes: 400,
        ),

        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@TheFashionista',
          userLongName: 'Fashionista',
          time: DateTime.now().subtract(Duration(minutes: 30)),
          description: 'Just dropped my latest fashion line! Check it out and let me know what you think! 👗✨ #Fashion',
          imageURL: 'https://images.pexels.com/photos/704965/pexels-photo-704965.jpeg',
          numComments: 90,
          numRetweets: 200,
          numLikes: 350,
        ),

        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@NatureLover',
          userLongName: 'Nature Lover',
          time: DateTime.now().subtract(Duration(hours: 4)),
          description: 'Exploring the beautiful trails of the national park. The views are breathtaking! 🏞️🍃 #NaturePhotography',
          imageURL: 'https://images.pexels.com/photos/2261478/pexels-photo-2261478.jpeg',
          numComments: 120,
          numRetweets: 280,
          numLikes: 600,
        ),

        TweetWidget(
          profileURL: 'https://cdn-icons-png.flaticon.com/512/9203/9203764.png',
          userShortName: '@DailyScience',
          userLongName: 'Daily Science',
          time: DateTime.now().subtract(Duration(minutes: 10)),
          description: 'Did you know? Honey never spoils! Archaeologists have found pots of honey in ancient Egyptian tombs that are over 3000 years old. 🍯 #FunFact',
          imageURL: 'https://images.pexels.com/photos/3048964/pexels-photo-3048964.jpeg',
          numComments: 75,
          numRetweets: 150,
          numLikes: 200,
        ),

      ],
    );
  }
}

class TweetWidget extends StatefulWidget {
  final String profileURL;
  final String userShortName;
  final String userLongName;
  final DateTime time;
  final String description;
  final String imageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;

  const TweetWidget({
    super.key,
    required this.profileURL,
    required this.userShortName,
    required this.userLongName,
    required this.time,
    required this.description,
    required this.imageURL,
    required this.numComments,
    required this.numRetweets,
    required this.numLikes,
  });

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  late bool _isLiked;
  late bool _isRetweeted;
  late int _likes;
  late int _retweets;

  @override
  void initState() {
    super.initState();
    _isLiked = false;
    _isRetweeted = false;
    _likes = widget.numLikes;
    _retweets = widget.numRetweets;
  }

  Widget build(BuildContext context) {
    final TextStyle userIDTextStyle = TextStyle(
      fontSize: 15,
      color: Colors.black.withOpacity(0.5),
    );

    String formattedTime = DateFormat('h:mm a').format(widget.time);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundColor: Colors.black, backgroundImage: NetworkImage(widget.profileURL), radius: 20,),

        const SizedBox(width: 10,),
        Expanded( // Expands this column to take up available space
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: <Widget>[
              // Username, ID, and time
              Row(
                children: <Widget>[
                  Text(
                    widget.userLongName,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Text(widget.userShortName, style: userIDTextStyle),
                  Text(" • ", style: userIDTextStyle), // Dot between user and time
                  Text(formattedTime, style: userIDTextStyle),
                  const Icon(Icons.expand_more, color: Colors.grey, size: 15,)
                ],
              ),

              // Tweet body text
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  widget.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image(
                    image: NetworkImage(
                      widget.imageURL,
                    ),
                    height: 200, // Set a fixed height for the image
                    width: double.infinity, // Take the full width
                    fit: BoxFit.cover, // Ensures the image scales properly
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: [
                          const Icon(Icons.chat_bubble_outline_rounded, color: Colors.grey, size: 15),
                          Text(widget.numComments.toString(), style: userIDTextStyle),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isRetweeted = !_isRetweeted;
                                  _retweets += _isRetweeted ? 1 : -1;
                                });
                              },
                              icon: Icon(
                                  _isRetweeted ? Icons.repeat : Icons.repeat_outlined,
                                  color: _isRetweeted ? Colors.greenAccent : null,
                                  size:15
                              )
                          ),
                          Text(_retweets.toString(), style: userIDTextStyle),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                  _likes += _isLiked ? 1 : -1;
                                });
                              },
                              icon: Icon(
                                  _isLiked ? Icons.favorite : Icons.favorite_border,
                                  color: _isLiked ? Colors.red : null,
                                  size:15
                              )
                          ),
                          Text(_likes.toString(), style: userIDTextStyle),
                        ],
                      ),

                      const Row(
                        children: [
                          Icon(Icons.bookmark_border_rounded, color: Colors.grey, size: 15,)
                        ],
                      )

                    ]
                ),
              ),

              const SizedBox(height: 20,)
            ],
          ),
        ),
      ],
    );
  }

}
