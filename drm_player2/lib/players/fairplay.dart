import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:drm_player2/constants.dart';

class FairplayPlayer extends StatefulWidget {
  const FairplayPlayer({Key? key}) : super(key: key);

  @override
  _FairplayPlayerState createState() => _FairplayPlayerState();
}

class _FairplayPlayerState extends State<FairplayPlayer> {
  late BetterPlayerController _fairplayController;

  @override
  void initState() {
    // TODO: implement initState
    setUpFairplayController();
    super.initState();
  }

  void setUpFairplayController() async {
    try {
      BetterPlayerConfiguration betterPlayerConfig =
          const BetterPlayerConfiguration(
              aspectRatio: 16 / 9, fit: BoxFit.contain);
      _fairplayController = BetterPlayerController(betterPlayerConfig);
      BetterPlayerDataSource _fairplayDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        kFairplayHlsUrl,
        drmConfiguration: BetterPlayerDrmConfiguration(
          drmType: BetterPlayerDrmType.fairplay,
          certificateUrl: kFairplayCertificateUrl,
          licenseUrl: kFairplayLicenseUrl,
        ),
      );
      await _fairplayController.setupDataSource(_fairplayDataSource);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fairplay Player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _fairplayController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
