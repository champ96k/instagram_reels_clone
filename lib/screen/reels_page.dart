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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ///[Right side] components
            Positioned(
              bottom: _size.height * 0.06,
              right: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    maxRadius: 18.0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black54,
                      size: 16.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8.0),
                  CircleAvatar(
                    maxRadius: 18.0,
                    child: Icon(
                      Icons.comment,
                      color: Colors.black54,
                      size: 16.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8.0),
                  CircleAvatar(
                    maxRadius: 18.0,
                    child: Icon(
                      Icons.share,
                      color: Colors.black54,
                      size: 16.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: _size.height * 0.01,
              right: 0.0,
              left: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoDuration,
                    style: _textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  SizedBox(
                    width: _size.width * 0.8,
                    child: Text(
                      videoTitle,
                      style: _textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
