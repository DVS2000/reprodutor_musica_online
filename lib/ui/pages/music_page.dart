import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool _play = false;
  String _currentPosition = "";

  double volume = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AudioWidget.assets(
        path: "assets/music.mp3",
        play: _play,
        onReadyToPlay: (total) {
          setState(() {
            _currentPosition = "${Duration().mmSSFormat} / ${total.mmSSFormat}";
          });
        },
        onPositionChanged: (current, total) {
          setState(() {
            _currentPosition = "${current.mmSSFormat} / ${total.mmSSFormat}";
          });
        },
        volume: volume,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("Country music"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: CircleBorder(),
                padding: EdgeInsets.all(14),
                color: Theme.of(context).primaryColor,
                child: Icon(
                  _play ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _play = !_play;
                  });
                },
              ),
            ),

            FlatButton(
              onPressed: () => setState(() => volume = 1.0),
              child: Text("AUMENTAR"),
            ),
            Text(_currentPosition),
          ],
        ),
      ),
    );
  }
}

extension FormatString on Duration {
  String get mmSSFormat {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes =
        twoDigits(this.inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(this.inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
