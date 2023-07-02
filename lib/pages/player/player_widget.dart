import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';
import 'player_model.dart';

class PlayerWidget extends StatefulWidget {
  final String? videoUrl;

  const PlayerWidget({
    Key? key,
    this.videoUrl,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late PlayerModel _model;

  @override
  void initState() {
    super.initState();
    _model = PlayerModel();
    _model.setVideoSource(widget.videoUrl!);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: MeeduVideoPlayer(
        controller: _model.playerController,
      ),
    );
  }
}
