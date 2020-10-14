import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salim/pages/intro_2.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';
import 'package:video_player/video_player.dart';

class UsingApp extends StatefulWidget {
  @override
  _UsingAppState createState() => _UsingAppState();
}

class _UsingAppState extends State<UsingApp> {
  final videoPlayerController =
      VideoPlayerController.asset('assets/videos/use_app.mp4');

  ChewieController chewieController;
  Chewie playerWidget;
  @override
  void initState() {
    print('in the _UsingAppState ');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTheme(
        indicator: 'Home_ind',
        illustration: Chewie(controller: chewieController),
        question: AppStrings.usingApp,
        buttonsAlignment: Alignment.bottomRight,
        buttons: NextBTN(onTab: () => findViewById(context, Intro2())),
      ),
    );
  }
}

// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// class UsingApp extends StatefulWidget {
//   @override
//   _UsingAppState createState() => _UsingAppState();
// }

// class _UsingAppState extends State<UsingApp> {
//   final String videURL =
//       'https://www.youtube.com/watch?v=MNl3AekxsBA&feature=youtu.be';

//   YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(videURL),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       onExitFullScreen: () =>
//           SystemChrome.setPreferredOrientations(DeviceOrientation.values),
//       player: YoutubePlayer(controller: _controller),
//       builder: (context, player) => Scaffold(
//         body: PageTheme(
//           indicator: 'Home_ind',
//           illustration: player,
//           question: AppStrings.usingApp,
//           buttonsAlignment: Alignment.bottomRight,
//           buttons: NextBTN(onTab: ()=> findViewById(context, Intro2())),
//         ),
//       ),
//     );
//   }
// }
