import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    
    super.initState();
    _controller = VideoPlayerController.network(
        'https://d3n0q0ds2a28nv.cloudfront.net/1/480p_0.4mbps.mp4?Expires=1567171924&Signature=qNOoFuRhsF2Vy6a7BAS~NK11rU7fnLXnaSQ0wJgxiivYWduD2oRml41pOVA301gjSLXt0Pgp4IRHqxJTbovg89S8cxkpav257O-IqFMWMTO3H7sQrLDSIHb~jFnYBs7JADpCdp7EHAOnMtvBALNneVJwiaw645yfpyqWNEErpvSZnwkYZnA~eAqhyaIiiJNqkDFq3xIjlpboJq3fHkf9T1NugYTHRYWMGq3RB5Gj30NzQZUPHgHrHJ0ksEYE6Prn6OT1kFa0803D~C4eZTy5D75cdK7MxMfvAdL1lDonMzcv4E1oBsGClK86EDzc2ogp79XHif9iBTXgB9MXb27sJA__&Key-Pair-Id=APKAJBQQNFEQFM2O4YGQ')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
