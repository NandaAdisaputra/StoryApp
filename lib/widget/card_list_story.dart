import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:storyappsdicoding/model/list_story.dart';
import 'package:storyappsdicoding/utils/common.dart';

class CardListStories extends StatelessWidget {
  final ListStory? stories;
  final VoidCallback onTap;

  const CardListStories({super.key, required this.stories,
   required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap:  onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageWidget(context),
              _buildTitleWidget(context),
              _buildDescriptionWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            cacheKey: stories?.photoUrl ?? '',
            imageUrl: stories?.photoUrl ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            cacheManager: CacheManager(Config(
              'photoUrl-cache',
              stalePeriod: const Duration(days: 7),
              maxNrOfCacheObjects: 200,
            )),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Text(
        stories?.name ?? AppLocalizations.of(context)!.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildDescriptionWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Text(
        stories?.description ?? AppLocalizations.of(context)!.descriptionStory,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
