import 'package:flutter/material.dart';
import 'package:meedu_player/meedu_player.dart';

class PlayerModel extends ChangeNotifier {
  final MeeduPlayerController playerController = MeeduPlayerController();

  void setVideoSource(String videoUrl) {
    playerController.setDataSource(
      DataSource(
        type: DataSourceType.network,
        source: videoUrl,
      ),
      autoplay: true,
    );
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }
}
