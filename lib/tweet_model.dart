class Tweet {
  final String profileURL;
  final String userShortName;
  final String userLongName;
  final DateTime time;
  final String description;
  final String? imageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;

  Tweet({
    required this.profileURL,
    required this.userShortName,
    required this.userLongName,
    required this.time,
    required this.description,
    this.imageURL,
    required this.numComments,
    required this.numRetweets,
    required this.numLikes,
  });
}