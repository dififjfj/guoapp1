import 'video_enhancement_preferences.dart';

const playbackSpeeds = [.5, .75, 1.0, 1.25, 1.5, 2.0, 3.0];

class PlaybackPreferences {
  const PlaybackPreferences({
    this.speed = 1,
    this.quality = 0,
    this.autoAdvance = true,
    this.danmaku = true,
    this.preload = true,
    this.controlBarRight = true,
    this.gestureSensitivity = 1,
    this.haptics = true,
    this.enhancement = const VideoEnhancementPreferences(),
  });

  final double speed;
  final int quality;
  final bool autoAdvance;
  final bool danmaku;
  final bool preload;
  final bool controlBarRight;
  final int gestureSensitivity;
  final bool haptics;
  final VideoEnhancementPreferences enhancement;

  PlaybackPreferences copyWith({
    double? speed,
    int? quality,
    bool? autoAdvance,
    bool? danmaku,
    bool? preload,
    bool? controlBarRight,
    int? gestureSensitivity,
    bool? haptics,
    VideoEnhancementPreferences? enhancement,
  }) => PlaybackPreferences(
    speed: speed ?? this.speed,
    quality: quality ?? this.quality,
    autoAdvance: autoAdvance ?? this.autoAdvance,
    danmaku: danmaku ?? this.danmaku,
    preload: preload ?? this.preload,
    controlBarRight: controlBarRight ?? this.controlBarRight,
    gestureSensitivity: gestureSensitivity ?? this.gestureSensitivity,
    haptics: haptics ?? this.haptics,
    enhancement: enhancement ?? this.enhancement,
  );

  Map<String, dynamic> toJson() => {
    'speed': speed,
    'quality': quality,
    'autoAdvance': autoAdvance,
    'danmaku': danmaku,
    'preload': preload,
    'controlBarRight': controlBarRight,
    'gestureSensitivity': gestureSensitivity,
    'haptics': haptics,
    'enhancement': enhancement.toJson(),
  };

  factory PlaybackPreferences.fromJson(Map<String, dynamic> value) {
    final speed = (value['speed'] as num? ?? 1).toDouble();
    final quality = value['quality'] as int? ?? 0;
    final autoAdvance = value['autoAdvance'] as bool? ?? true;
    final danmaku = value['danmaku'] as bool? ?? true;
    final preload = value['preload'] as bool? ?? true;
    final controlBarRight = value['controlBarRight'] as bool? ?? true;
    final gestureSensitivity = value['gestureSensitivity'] as int? ?? 1;
    final haptics = value['haptics'] as bool? ?? true;
    if (!playbackSpeeds.contains(speed) || quality < 0 || quality > 4320) {
      throw const FormatException('播放偏好无效');
    }
    return PlaybackPreferences(
      speed: speed,
      quality: quality,
      autoAdvance: autoAdvance,
      danmaku: danmaku,
      preload: preload,
      controlBarRight: controlBarRight,
      gestureSensitivity: gestureSensitivity.clamp(0, 2),
      haptics: haptics,
      enhancement: VideoEnhancementPreferences.fromJson(value['enhancement']),
    );
  }
}
