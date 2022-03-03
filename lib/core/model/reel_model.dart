// To parse this JSON data, do
//
//     final reelModel = reelModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.freezed.dart';
part 'reel_model.g.dart';

@freezed
abstract class ReelModel with _$ReelModel {
  const factory ReelModel(
    String? title,
    String? nid,
    String? type,
    @JsonKey(name: 'short_video_id') String? shortVideoId,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'orignal_imageUrl') String? orignalImageUrl,
    @JsonKey(name: 'section_image') String? sectionImage,
    @JsonKey(name: 'video_imageurl_landscape') String? videoImageurlLandscape,
    @JsonKey(name: 'postDateUnix') String? postDateUnix,
    String? path,
    String? description,
    int? viewCount,
    String? viewCountFormat,
    String? postDateStr,
    String? commentCount,
    @JsonKey(name: 'field_uae_microsite_categories')
        String? fieldUaeMicrositeCategories,
    @JsonKey(name: 'field_uae_microsite_featured_art')
        String? fieldUaeMicrositeFeaturedArt,
    List<Vimeo?>? vimeo,
  ) = _ReelModel;

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);
}

@freezed
abstract class Vimeo with _$Vimeo {
  const factory Vimeo(
    String? quality,
    String? type,
    int? width,
    int? height,
    String? link,
    @JsonKey(name: 'created_time') DateTime? createdTime,
    int? fps,
    int? size,
    String? md5,
    @JsonKey(name: 'public_name') String? publicName,
    @JsonKey(name: 'size_short') String? sizeShort,
    @JsonKey(name: 'link_secure') String? linkSecure,
    String? url,
    String? profile,
  ) = _Vimeo;

  factory Vimeo.fromJson(Map<String, dynamic> json) => _$VimeoFromJson(json);
}
