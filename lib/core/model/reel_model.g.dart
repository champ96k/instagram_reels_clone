// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReelModel _$$_ReelModelFromJson(Map<String, dynamic> json) => _$_ReelModel(
      json['title'] as String?,
      json['nid'] as String?,
      json['type'] as String?,
      json['short_video_id'] as String?,
      json['imageUrl'] as String?,
      json['orignal_imageUrl'] as String?,
      json['section_image'] as String?,
      json['video_imageurl_landscape'] as String?,
      json['postDateUnix'] as String?,
      json['path'] as String?,
      json['description'] as String?,
      json['viewCount'] as int?,
      json['viewCountFormat'] as String?,
      json['postDateStr'] as String?,
      json['commentCount'] as String?,
      json['field_uae_microsite_categories'] as String?,
      json['field_uae_microsite_featured_art'] as String?,
      (json['vimeo'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Vimeo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ReelModelToJson(_$_ReelModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'nid': instance.nid,
      'type': instance.type,
      'short_video_id': instance.shortVideoId,
      'imageUrl': instance.imageUrl,
      'orignal_imageUrl': instance.orignalImageUrl,
      'section_image': instance.sectionImage,
      'video_imageurl_landscape': instance.videoImageurlLandscape,
      'postDateUnix': instance.postDateUnix,
      'path': instance.path,
      'description': instance.description,
      'viewCount': instance.viewCount,
      'viewCountFormat': instance.viewCountFormat,
      'postDateStr': instance.postDateStr,
      'commentCount': instance.commentCount,
      'field_uae_microsite_categories': instance.fieldUaeMicrositeCategories,
      'field_uae_microsite_featured_art': instance.fieldUaeMicrositeFeaturedArt,
      'vimeo': instance.vimeo,
    };

_$_Vimeo _$$_VimeoFromJson(Map<String, dynamic> json) => _$_Vimeo(
      json['quality'] as String?,
      json['type'] as String?,
      json['width'] as int?,
      json['height'] as int?,
      json['link'] as String?,
      json['created_time'] == null
          ? null
          : DateTime.parse(json['created_time'] as String),
      json['fps'] as int?,
      json['size'] as int?,
      json['md5'] as String?,
      json['public_name'] as String?,
      json['size_short'] as String?,
      json['link_secure'] as String?,
      json['url'] as String?,
      json['profile'] as String?,
    );

Map<String, dynamic> _$$_VimeoToJson(_$_Vimeo instance) => <String, dynamic>{
      'quality': instance.quality,
      'type': instance.type,
      'width': instance.width,
      'height': instance.height,
      'link': instance.link,
      'created_time': instance.createdTime?.toIso8601String(),
      'fps': instance.fps,
      'size': instance.size,
      'md5': instance.md5,
      'public_name': instance.publicName,
      'size_short': instance.sizeShort,
      'link_secure': instance.linkSecure,
      'url': instance.url,
      'profile': instance.profile,
    };
