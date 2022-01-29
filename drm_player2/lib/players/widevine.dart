import 'package:better_player/better_player.dart';
import 'package:drm_player2/constants.dart';
import 'package:flutter/material.dart';

class WidevinePlayer extends StatefulWidget {
  const WidevinePlayer({Key? key}) : super(key: key);

  @override
  _WidevinePlayerState createState() => _WidevinePlayerState();
}

class _WidevinePlayerState extends State<WidevinePlayer> {
  late BetterPlayerController _widevineController;

  @override
  void initState() {
    setUpWidvineController();
    super.initState();
  }

  void setUpWidvineController() async {
    try {
      BetterPlayerConfiguration betterPlayerConfig =
          const BetterPlayerConfiguration(
              aspectRatio: 16 / 9, fit: BoxFit.contain);

      _widevineController = BetterPlayerController(betterPlayerConfig);

      BetterPlayerDataSource widevineDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network, kWidevineVideoUrl,
          drmConfiguration: BetterPlayerDrmConfiguration(
            drmType: BetterPlayerDrmType.widevine,
            licenseUrl: kLicenseUrl,
          ));

      await _widevineController.setupDataSource(widevineDataSource);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widevine Player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _widevineController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
