import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyappsdicoding/model/list_story.dart';

part 'stories.freezed.dart';
part 'stories.g.dart';

@freezed
class StoriesResults with _$StoriesResults {
  const factory StoriesResults({
    bool? error,
    String? message, required List<ListStory>? listStory,
  }) = _StoriesResults;

  factory StoriesResults.fromJson(Map<String, dynamic> json) =>
      _$StoriesResultsFromJson(json);
}
