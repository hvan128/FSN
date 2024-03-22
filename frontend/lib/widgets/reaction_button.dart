import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frontend/theme/color.dart';

enum EReaction { like, delicious, love, none }

typedef OnButtonPressedCallback = void Function(EReaction newReaction);

class ReactionButton extends StatefulWidget {
  const ReactionButton({
    super.key,
    this.initialReaction,
    this.onReactionChanged,
  });

  final EReaction? initialReaction;
  final OnButtonPressedCallback? onReactionChanged;

  @override
  State<ReactionButton> createState() => _ReactionButtonState();
}

class _ReactionButtonState extends State<ReactionButton> {
  EReaction _reaction = EReaction.none;
  bool _reactionView = false;

  GlobalKey btnKey = GlobalKey();
  final List<ReactionElement> reactions = [
    ReactionElement(
      EReaction.like,
      Image.asset('assets/icons/i16/vo-tay.png'),
    ),
    ReactionElement(
      EReaction.love,
      Image.asset('assets/icons/i16/heart.png'),
    ),
    ReactionElement(
      EReaction.delicious,
      Image.asset('assets/icons/i16/eat.png'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _reaction = widget.initialReaction ?? EReaction.none;
    setState(() {});
  }

  late OverlayEntry overlayEntry;

  void onCloseOverlay() {
    overlayEntry.remove();
  }

  void _showReactionPopUp(BuildContext context, Offset tapPosition) {
    final screenWidth = MediaQuery.of(context).size.width;
    double left = tapPosition.dx;
    if ((screenWidth - left) < 100) {
      left = left - 100;
    } else {
      left = left - 20;
    }
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: left - 50,
        top: tapPosition.dy - 65,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
                color: MyColors.white['c900']!,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: MyColors.grey['c300']!,
                )),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reactions.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 15 + index * 15,
                    child: FadeInAnimation(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _reaction = reactions[index].reaction;
                            if (widget.onReactionChanged != null) {
                              widget.onReactionChanged!(_reaction);
                            }
                            _reactionView = false;
                          });
                          onCloseOverlay();
                        },
                        icon: reactions[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showReactionPopUp(context, details.globalPosition);
        setState(() {
          _reactionView = true;
        });
      },
      onTap: () {
        if (_reactionView) {
          onCloseOverlay();
          _reactionView = false;
        } else {
          if (_reaction == EReaction.none) {
            _reaction = EReaction.like;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          } else {
            _reaction = EReaction.none;
            if (widget.onReactionChanged != null) {
              widget.onReactionChanged!(_reaction);
            }
          }
        }
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: MyColors.grey['c100']!,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/i16/heart-plus.png',
                color: MyColors.grey['c900']!, width: 17, height: 17),
          ],
        ),
      ),
    );
  }
}

class ReactionIcon extends StatelessWidget {
  const ReactionIcon({super.key, required this.reaction});
  final EReaction reaction;

  @override
  Widget build(BuildContext context) {
    switch (reaction) {
      case EReaction.like:
        return Image.asset('assets/icons/i16/vo-tay.png');
      case EReaction.love:
        return Image.asset('assets/icons/i16/heart.png');
      case EReaction.delicious:
        return Image.asset('assets/icons/i16/eat.png');
      case EReaction.none:
        return Image.asset('assets/icons/i16/heart-plus.png');
    }
  }
}

class ReactionElement {
  final EReaction reaction;
  final Widget icon;

  ReactionElement(this.reaction, this.icon);
}
