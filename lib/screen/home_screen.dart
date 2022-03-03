import 'package:flutter/material.dart';
import 'package:instagram_reels/core/model/reel_model.dart';
import 'package:instagram_reels/cubit/reels_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_reels/screen/players/video_player_screen.dart';
import 'package:instagram_reels/screen/reels_page.dart';

class HomeScreen extends StatefulWidget {
  final String? searchText;
  const HomeScreen({
    Key? key,
    this.searchText,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;

  final List<ReelModel> _allReels = [];

  int _totalReels = 0;

  @override
  void initState() {
    _fetchReels(pageNumber: 0);
    _scrollController.addListener(pagination);
    super.initState();
  }

  void pagination() {
    if ((_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent)) {
      _fetchReels(pageNumber: _page++);
    }
  }

  Future<void> _fetchReels({required int pageNumber}) async {
    // debugPrint("page no: $pageNumber");
    await context.read<ReelsCubit>().fectchReels(page: pageNumber);
    _allReels.removeRange(0, _totalReels);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ReelsLoadedState) {
            _allReels.addAll(state.models);
            _totalReels = state.models.length;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              controller: _scrollController,
              addAutomaticKeepAlives: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _allReels.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: _size.height,
                  width: _size.width,
                  child: Stack(
                    children: [
                      VideoPlayerScreen(
                        url: _allReels[index].vimeo![0]?.url,
                      ),
                      ReelsPage(
                        videoDuration: _allReels[index].postDateStr ?? '',
                        videoTitle: _allReels[index].title ?? '',
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is ReelsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
