import 'package:flutter/material.dart';

class ReelsPage extends StatelessWidget {
  final String videoDuration;
  final String videoTitle;
  const ReelsPage({
    Key? key,
    required this.videoDuration,
    required this.videoTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: _size.height,
      width: _size.width,
      child: Stack(
        children: [
          ///[Right side] components
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: const [
                CircleAvatar(
                  child: Icon(Icons.favorite),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  child: Icon(Icons.comment),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  child: Icon(Icons.share),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoDuration,
                  style: _textTheme.bodyText2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  videoTitle,
                  style: _textTheme.bodyText2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
