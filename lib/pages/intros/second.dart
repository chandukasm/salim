import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:salim/pages/intros/using_app.dart';
import 'package:salim/utils/findView.dart';
import 'package:salim/utils/strings.dart';
import 'package:salim/widgets/nav_buttons_widgets.dart';
import 'package:salim/widgets/theme_widget.dart';
import 'package:video_player/video_player.dart';

class Seconnd1 extends StatefulWidget {
  @override
  _Seconnd1State createState() => _Seconnd1State();
}

class _Seconnd1State extends State<Seconnd1> {
  final videoPlayerController =
      VideoPlayerController.asset('assets/videos/out.mp4');

  ChewieController chewieController;
  Chewie playerWidget;

  @override
  void initState() {
    print('in the _Seconnd1State ');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      // aspectRatio: 3 / 2,
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
        question: AppStrings.introVideo,
        buttonsAlignment: Alignment.bottomRight,
        buttons: NextBTN(onTab: () => findViewById(context, UsingApp())),
      ),
    );
  }
}

// // import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// class IntroVideo extends StatefulWidget {
//   @override
//   _IntroVideoState createState() => _IntroVideoState();
// }

// class _IntroVideoState extends State<IntroVideo> {
//   // final String videURL =
//   //     'https://www.youtube.com/watch?v=zCuwSf3XOtE&feature=youtu.be';

//   // YoutubePlayerController _controller;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _controller = YoutubePlayerController(
//   //     initialVideoId: YoutubePlayer.convertUrlToId(videURL),
//   //   );
//   //   // SystemChrome.setPreferredOrientations([
//   //   //   DeviceOrientation.portraitUp,
//   //   //   DeviceOrientation.landscapeRight,
//   //   //   DeviceOrientation.landscapeLeft,
//   //   // ]);
//   // }

//   // @override
//   // void dispose() {
//   //   // SystemChrome.setPreferredOrientations([
//   //   //   DeviceOrientation.portraitUp,
//   //   //   DeviceOrientation.portraitDown,
//   //   // ]);
//   //   _controller.dispose();
//   //   super.dispose();
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return YoutubePlayerBuilder(
//   //     onExitFullScreen: () =>
//   //         SystemChrome.setPreferredOrientations(DeviceOrientation.values),
//   //     player: YoutubePlayer(controller: _controller),
//   //     builder: (context, player) => Scaffold(
//   //       body: PageTheme(
//   //         indicator: 'Home_ind',
//   //         illustration: player,
//   //         question: AppStrings.introVideo,
//   //         buttonsAlignment: Alignment.bottomRight,
//   //         buttons: NextBTN(onTab: () => findViewById(context, UsingApp())),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
