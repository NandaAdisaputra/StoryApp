import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/detail/detail_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/result_state.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final storyDetailProvider =
      Provider.of<DetailProvider>(context, listen: false);
      storyDetailProvider.getStory(widget.id);
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Consumer<DetailProvider>(
        builder: (context, story, _) {
          if (story.state == ResultState.loading) {
            return _buildLoading();
          } else if (story.state == ResultState.error) {
            return _buildError(story.message);
          } else if (story.state == ResultState.success) {
            _markers.add(
              Marker(
                markerId: MarkerId(story.story!.id!),
                position: LatLng(
                  story.story!.lat!.toDouble(),
                  story.story!.lon!.toDouble(),
                ),
                infoWindow: InfoWindow(
                  title: story.story!.name,
                  snippet:
                  '${story.placeMark!.street},${story.placeMark!.subLocality},${story.placeMark!.subAdministrativeArea},${story.placeMark!.administrativeArea}',
                ),
              ),
            );
            return _buildSuccess(story);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String message) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: RefreshIndicator(
        onRefresh: () {
          return Provider.of<DetailProvider>(context, listen: false)
              .getStory(widget.id);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Text(message),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess(DetailProvider story) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: RefreshIndicator(
        onRefresh: () {
          return Provider.of<DetailProvider>(context, listen: false)
              .getStory(widget.id);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeroImage(story),
              _buildStoryDetails(story),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroImage(DetailProvider story) {
    return Hero(
      tag: widget.id,
      child: CachedNetworkImage(
        alignment: Alignment.topCenter,
        height: 300,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        imageUrl: story.story!.photoUrl!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildStoryDetails(DetailProvider story) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            story.story!.name!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            story.story!.createdAt != null
                ? DateFormat('dd MMM yyyy').format(story.story!.createdAt!)
                : '',
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppLocalizations.of(context)!.descriptionStory,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            story.story!.description ?? '',
            textAlign: TextAlign.justify,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Text(
            AppLocalizations.of(context)!.location,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${story.placeMark!.street},${story.placeMark!.subLocality},${story.placeMark!.subAdministrativeArea},${story.placeMark!.administrativeArea}',
          ),
        ),
        _buildGoogleMap(story),
      ],
    );
  }

  Widget _buildGoogleMap(DetailProvider story) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GoogleMap(
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            story.story!.lat!.toDouble(),
            story.story!.lon!.toDouble(),
          ),
          zoom: 17,
        ),
      ),
    );
  }
}
