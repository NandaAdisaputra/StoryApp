import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/home/home_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/result_state.dart';
import 'package:storyappsdicoding/widget/card_list_story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final storyProvider = context.read<HomeProvider>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (storyProvider.pageItems != null) {
          storyProvider.getStories();
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<HomeProvider>(context, listen: false).getStories();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(strings?.titleApp ?? ''),
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed('profile');
              },
              icon: const Icon(
                Icons.account_circle,
                color: Colors.deepOrangeAccent,
              ),
            ),
            IconButton(
              onPressed: () {
                context.pushNamed('settings');
              },
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('add_story');
          },
          backgroundColor: Colors.deepOrangeAccent,
          splashColor: Colors.orange.withOpacity(0.8),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Consumer<HomeProvider>(
          builder: (context, story, _) {
            if (story.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (story.state == ResultState.error) {
              return RefreshIndicator(
                onRefresh: () {
                  return Provider.of<HomeProvider>(context, listen: false)
                      .getStories();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Text(story.message), // Handling possible null value
                  ),
                ),
              );
            } else {
              if (story.stories.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () {
                    return Provider.of<HomeProvider>(context, listen: false)
                        .getStories();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Center(
                      child: Text(strings?.noData ??
                          ''), // Handling possible null value
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () {
                    return Provider.of<HomeProvider>(context, listen: false)
                        .getStories(isRefresh: true);
                  },
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: story.stories.length +
                        (story.pageItems != null ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == story.stories.length &&
                          story.pageItems != null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (story.stories.isEmpty) {
                        return Center(
                          child: Text(strings?.noData ??
                              ''), // Handling possible null value
                        );
                      }
                      final stories = story.stories[index];
                      return CardListStories(
                        stories: stories,
                        onTap: () {
                          context.pushNamed(
                            'story-detail',
                            pathParameters: {
                              'id': stories.id ?? ''
                            }, // Handling possible null value
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
