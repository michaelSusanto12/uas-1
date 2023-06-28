import 'package:flutter/material.dart';
import 'package:insta/app/theme.dart';


class FavoriteIconButton extends StatefulWidget {
  
  const FavoriteIconButton({
    Key? key,
    required this.isLiked,
    this.size = 22,
    required this.onTap,
  }) : super(key: key);

  final bool isLiked;

  final double size;

  final Function(bool val) onTap;

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isLiked = widget.isLiked;

  void _handleTap() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onTap(isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedCrossFade(
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: Icon(
          Icons.favorite,
          color: AppColors.like,
          size: widget.size,
        ),
        secondChild: Icon(
          Icons.favorite_outline,
          size: widget.size,
        ),
        crossFadeState:
            isLiked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
