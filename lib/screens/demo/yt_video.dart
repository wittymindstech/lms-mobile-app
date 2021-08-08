import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({Key key}) : super(key: key);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  String videoURL = "https://www.youtube.com/watch?v=s4WQgFpmxt4";
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
// youtubeVideo() {
//   String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";
//   YoutubePlayerController _controller;
//   _controller = YoutubePlayerController(
//     initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
//   );
// }
