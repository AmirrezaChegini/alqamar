import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/di.dart';
import 'package:al_qamar/utils/extensions/duration.dart';
import 'package:al_qamar/widgets/anim/animated_icon.dart';
import 'package:al_qamar/widgets/icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioStream extends StatefulWidget {
  const AudioStream({
    super.key,
  });

  @override
  State<AudioStream> createState() => _AudioStreamState();
}

class _AudioStreamState extends State<AudioStream> {
  final AudioPlayer _audioPlayer = locator.get();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(5).copyWith(left: 15),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            StreamBuilder(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) => Text(snapshot.data.format()),
            ),
            const SizedBox(width: 8),
            IconBtn(
              onTap: () => _audioPlayer.playing
                  ? _audioPlayer.pause()
                  : _audioPlayer.play(),
              padding: 5,
              child: StreamBuilder(
                stream: _audioPlayer.playingStream,
                initialData: false,
                builder: (context, snapshot) => IconAnimated(
                  icon: AnimatedIcons.play_pause,
                  state: snapshot.data!,
                ),
              ),
            ),
            const Text('Live'),
            const Spacer(),
            IconBtn(
              onTap: () => _audioPlayer.volume == 0
                  ? _audioPlayer.setVolume(1)
                  : _audioPlayer.setVolume(0),
              child: StreamBuilder(
                stream: _audioPlayer.volumeStream,
                initialData: 0,
                builder: (context, snapshot) => Icon(
                  snapshot.data == 0
                      ? Icons.volume_off_rounded
                      : Icons.volume_up_rounded,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
