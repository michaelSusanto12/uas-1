import 'package:flutter/material.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

import '../../../app/state/models/models.dart';

enum TypeOfComment {
  activityComment,

  reactionComment,
}

class CommentFocus {
  const CommentFocus({
    required this.typeOfComment,
    required this.id,
    required this.user,
    this.reaction,
  });

  final Reaction? reaction;

  final TypeOfComment typeOfComment;

  final String id;

  final StreamagramUser user;
}

class CommentState extends ChangeNotifier {
  CommentState({
    required this.activityId,
    required this.activityOwnerData,
  });

  final String activityId;

  final StreamagramUser activityOwnerData;

  late CommentFocus commentFocus = CommentFocus(
    typeOfComment: TypeOfComment.activityComment,
    id: activityId,
    user: activityOwnerData,
  );

  void setCommentFocus(CommentFocus focus) {
    commentFocus = focus;
    notifyListeners();
  }

  void resetCommentFocus() {
    commentFocus = CommentFocus(
      typeOfComment: TypeOfComment.activityComment,
      id: activityId,
      user: activityOwnerData,
    );
    notifyListeners();
  }
}
