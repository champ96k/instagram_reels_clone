import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String? url;
  const VideoPlayerScreen({Key? key, this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  final ValueNotifier<bool> _playingValueNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    if (widget.url != null) {
      _controller = VideoPlayerController.network(widget.url!)
        ..initialize().then((_) {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              _controller.setLooping(true);
            }
          });
        });

      _controller.addListener(() {
        _playingValueNotifier.value = _controller.value.isPlaying;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: _size.height,
        width: _size.width,
        child: _controller.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                },
                child: Center(
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _playingValueNotifier,
                          builder: (context, value, child) {
                            return value
                                ? const Text('')
                                : const Icon(Icons.play_arrow,
                                    color: Colors.white);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
