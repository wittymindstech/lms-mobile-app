// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart' as vid;

// class VideoPlayer extends StatefulWidget {
//   const VideoPlayer({Key key}) : super(key: key);

//   @override
//   _VideoPlayerState createState() => _VideoPlayerState();
// }

// class _VideoPlayerState extends State<VideoPlayer>
//     with SingleTickerProviderStateMixin {
//   vid.VideoPlayerController _videoPlayerController;
//   Future<void> _videoPlayerFuture;
//   AnimationController _animationController;
//   bool _controls = true;
//   @override
//   void dispose() { 
//         _videoPlayerController?.dispose();
//     _animationController?.dispose();
//     super.dispose();
//   }
//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 200));

//     _videoPlayerController = vid.VideoPlayerController.network(
//         "https://d3gxnqjvuiz5a8.cloudfront.net/media/education/SantoshSir1.mp4");
//     _videoPlayerFuture = _videoPlayerController.initialize().then((_) => {
//           _videoPlayerController
//             ..play()
//             ..setVolume(1.0),
//           _animationController.forward()
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height:200,
//        child: InkWell(
//         child: vid.VideoPlayer(_videoPlayerController),
//         onTap: () {
//           setState(() => _controls = !_controls);
//         },
//       ),
//       ),
//       floatingActionButton: (_controls)
//           ? FloatingActionButton(
//               onPressed: () {
//                 setState(() {
//                   if (_videoPlayerController.value.isPlaying) {
//                     _videoPlayerController.pause();
//                     _animationController.reverse();
//                   } else {
//                     _videoPlayerController.play();
//                     _animationController.forward();
//                   }
//                 });
//               },
//               child: AnimatedIcon(
//                 icon: AnimatedIcons.play_pause,
//                 progress: _animationController,
//               ),
//             )
//           : null,
//     );
//   }
// }




import 'package:WTApp/global/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:screen/screen.dart' as wake;
import 'package:video_player/video_player.dart';
// import '../widgets/custom_logo_widget.dart';
// import '../hel/pers/screen.dart';
// import '../'
class VideoView extends StatefulWidget {
  // final String link;
  final bool progress;

  VideoView({this.progress = true});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  Future<void> _videoPlayerFuture;
  AnimationController _animationController;
  bool _controls = true;

  @override
  void initState() {
    super.initState();
    Screen.hideSystemBars();
    Screen.setLandscape();
    // wake.Screen.keepOn(true);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // if (widget.link.toString().contains(RegExp(
    //         r"(.mkv|.mp4|.webm|.ogv|.m3u|.m3u8)",
    //         caseSensitive: false)) &&
    //     !widget.link.toString().contains(RegExp(
    //         r"(<iframe|<div|href=|src=|width=|height=|<frame)",
    //         caseSensitive: false)))
            
            
            // {
      _videoPlayerController = VideoPlayerController.network("https://d3gxnqjvuiz5a8.cloudfront.net/media/education/SantoshSir1.mp4");
      _videoPlayerFuture = _videoPlayerController.initialize().then((_) => {
            _videoPlayerController
              ..play()
              ..setVolume(1.0),
            _animationController.forward()
          });
    // }
  }

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: _videoPlayerFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (_videoPlayerController.value.initialized &&
              snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Stack(fit: StackFit.passthrough, children: <Widget>[
                InkWell(
                  child: VideoPlayer(_videoPlayerController),
                  onTap: () {
                    setState(() {
                      _controls = !_controls;
                    });
                  },
                ),
                if (_controls)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: EdgeInsets.all(10.0),),
                  ),
                if (_controls)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: (_videoPlayerController.value.volume > 0.0)
                              ? Icon(Icons.volume_up)
                              : Icon(Icons.volume_off),
                          onPressed: () => {
                            if (_videoPlayerController.value.volume > 0.0)
                              {
                                setState(() {
                                  _videoPlayerController.setVolume(0.0);
                                })
                              }
                            else
                              {
                                setState(() {
                                  _videoPlayerController.setVolume(1.0);
                                })
                              }
                          },
                        )),
                  ),
                if (widget.progress && _controls)
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: VideoProgressIndicator(
                        _videoPlayerController,
                        padding: EdgeInsets.only(top: 20.0),
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            playedColor: Theme.of(context).primaryColor),
                      )),
              ]),
              floatingActionButton: (_controls)
                  ? FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (_videoPlayerController.value.isPlaying) {
                            _videoPlayerController.pause();
                            _animationController.reverse();
                          } else {
                            _videoPlayerController.play();
                            _animationController.forward();
                          }
                        });
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _animationController,
                      ),
                    )
                  : null,
            );
          } else {
            return Container(
              color: Theme.of(context).backgroundColor,
              height: Screen.heigth(context),
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
    
  }

  @override
  void dispose() {
    Screen.resetOrientation();
    Screen.showSystemBars();
    // wake.Screen.keepOn(false);
    _videoPlayerController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }
}
