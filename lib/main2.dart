import 'package:flutter/material.dart';
import 'package:twitter/reply_tweet.dart';
import 'package:twitter/tweet_model.dart';
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
      onHide: () {},
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
      onHide: () {},
    ),
    // Add more hardcoded tweets if necessary
  ];

  List<Tweet> _tweets = [];

  void initState() {
    super.initState();
    // Initialize with some example tweets
    _tweets = [
      Tweet(
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
      Tweet(
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
      )
    ];
  }



  // Method to navigate to CreateTweetPage and await result
  Future<void> _navigateToCreateTweetPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateTweetPage()),
    );

    if (result != null) {
      // If result is not null, add it to the list of tweets
      setState(() {
        _tweets.add(result);
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
      body: ListView.builder(
        itemCount: _tweets.length,
        itemBuilder: (context, index) {
          return TweetWidget(
            profileURL: _tweets[index].profileURL,
            userShortName: _tweets[index].userShortName,
            userLongName: _tweets[index].userLongName,
            time: _tweets[index].time,
            description: _tweets[index].description,
            imageURL: _tweets[index].imageURL,
            numComments: _tweets[index].numComments,
            numRetweets: _tweets[index].numRetweets,
            numLikes: _tweets[index].numLikes,
            onHide: () {
              setState(() {
                _tweets.removeAt(index); // Remove the tweet from the list
              });
            },
          );
        },
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
          onHide: () {},
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
          onHide: () {},
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
          onHide: () {},
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
          onHide: () {},
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
          onHide: () {},
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
          onHide: () {},
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
  final String? imageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;
  final VoidCallback onHide;  // Callback to notify the parent to hide the tweet

  const TweetWidget({
    Key? key,
    required this.profileURL,
    required this.userShortName,
    required this.userLongName,
    required this.time,
    required this.description,
    this.imageURL,
    required this.numComments,
    required this.numRetweets,
    required this.numLikes,
    required this.onHide,  // We pass a callback to hide the tweet
  }): super(key: key);

  @override
  _TweetWidgetState createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  late bool _isLiked;
  late bool _isRetweeted;
  late int _likes;
  late int _retweets;
  late List<Tweet> _replies;

  @override
  void initState() {
    super.initState();
    _isLiked = false;
    _isRetweeted = false;
    _likes = widget.numLikes;
    _retweets = widget.numRetweets;
    _replies = [];
  }

  Future<void> _navigateToReplyPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReplyPage()),
    );

    if (result != null) {
      // Add the reply to the list and increment the number of comments
      setState(() {
        _replies.add(result);
      });
    }
  }

  @override
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
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'hide') {
                        // Logic to hide the tweet
                        setState(() {
                          // Using a callback from parent widget to remove the tweet
                          widget.onHide(); // Notify parent to hide this tweet
                        });
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: 'hide',
                          child: Text('Hide Tweet'),
                        ),
                      ];
                    },
                    icon: const Icon(Icons.expand_more, color: Colors.grey, size: 15),
                  ),
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

              if (widget.imageURL != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      widget.imageURL!,
                      height: 200, // Set a fixed height for the image
                      width: double.infinity, // Take the full width
                      fit: BoxFit.cover, // Ensures the image scales properly
                    ),
                  ),
                ),
              ],

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: [
                          IconButton(
                            onPressed: _navigateToReplyPage, // Open reply page
                            icon: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.grey, size: 15),
                          ),
                          Text((_replies.length + widget.numComments).toString(), style: userIDTextStyle),
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
              if (_replies.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _replies.map((reply) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TweetWidget(
                          profileURL: reply.profileURL,
                          userShortName: reply.userShortName,
                          userLongName: reply.userLongName,
                          time: reply.time,
                          description: reply.description,
                          imageURL: reply.imageURL,
                          numComments: reply.numComments,
                          numRetweets: reply.numRetweets,
                          numLikes: reply.numLikes,
                          onHide: () {
                            // Add your logic to handle hiding the tweet if needed
                          },
                        ),
                      );
                    }).toList(),
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
