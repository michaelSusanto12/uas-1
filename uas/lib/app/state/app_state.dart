import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';
import 'models/models.dart';

import 'demo_users.dart';

class AppState extends ChangeNotifier {
  FlatFeed get currentUserFeed => _client.flatFeed('user', user.id);
  FlatFeed get currentTimelineFeed => _client.flatFeed('timeline', user.id);

  AppState({
    required StreamFeedClient client,
  }) : _client = client;

  late final StreamFeedClient _client;

  var isUploadingProfilePicture = false;

  StreamFeedClient get client => _client;

  StreamUser get user => _client.currentUser!;

  StreamagramUser? _streamagramUser;

  StreamagramUser? get streamagramUser => _streamagramUser;
  Future<bool> connect(DemoAppUser demoUser) async {
    final currentUser = await _client.setUser(
      User(id: demoUser.id),
      demoUser.token!,
      extraData: demoUser.data,
    );

    if (currentUser.data != null) {
      _streamagramUser = StreamagramUser.fromMap(currentUser.data!);
      await currentTimelineFeed.follow(currentUserFeed);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateProfilePhoto(String filePath) async {
    isUploadingProfilePicture = true;
    notifyListeners();

    final imageUrl = await client.images.upload(AttachmentFile(path: filePath));
    if (imageUrl == null) {
      debugPrint('Could not upload the image. Not setting profile picture');
      isUploadingProfilePicture = false;
      notifyListeners();
      return;
    }
    final results = await Future.wait([
      client.images.getResized(
        imageUrl,
        const Resize(500, 500),
      ),
      client.images.getResized(
        imageUrl,
        const Resize(50, 50),
      )
    ]);

    _streamagramUser = _streamagramUser?.copyWith(
      profilePhoto: imageUrl,
      profilePhotoResized: results[0],
      profilePhotoThumbnail: results[1],
    );

    isUploadingProfilePicture = false;

    if (_streamagramUser != null) {
      await client.currentUser!.update(_streamagramUser!.toMap());
    }

    notifyListeners();
  }
}
