import 'package:flutter/material.dart';

class CommunityFeed extends StatefulWidget {
  const CommunityFeed({Key? key}) : super(key: key);

  @override
  _CommunityFeedState createState() => _CommunityFeedState();
}

class _CommunityFeedState extends State<CommunityFeed> {
  final ValueNotifier<bool> _showCommentBox = ValueNotifier(false);
  final TextEditingController _commentTextController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  void openCommentBox({String? message}) {
    _commentTextController.text = message ?? '';
    _commentTextController.selection = TextSelection.fromPosition(
      TextPosition(offset: _commentTextController.text.length),
    );
    _showCommentBox.value = true;
    _commentFocusNode.requestFocus();
  }

  Future<void> addComment(String? message) async {
    if (message != null && message.isNotEmpty && message != '') {
      _commentTextController.clear();
      FocusScope.of(context).unfocus();
      _showCommentBox.value = false;
    }
  }

  @override
  void dispose() {
    _commentTextController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 6),
          title: Text("Feeds".toUpperCase(), style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
          actions: [Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.more_vert_rounded),
          )
          ]),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          _showCommentBox.value = false;
        },
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const PostCard();
              },
            ),
            _CommentBox(
              textEditingController: _commentTextController,
              focusNode: _commentFocusNode,
              addComment: addComment,
              showCommentBox: _showCommentBox,
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentBox extends StatefulWidget {
  const _CommentBox({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.addComment,
    required this.showCommentBox,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function(String?) addComment;
  final ValueNotifier<bool> showCommentBox;

  @override
  __CommentBoxState createState() => __CommentBoxState();
}

class __CommentBoxState extends State<_CommentBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
    reverseCurve: Curves.easeIn,
  );

  bool visibility = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          visibility = false;
        });
      } else {
        setState(() {
          visibility = true;
        });
      }
    });
    widget.showCommentBox.addListener(_showHideCommentBox);
  }

  void _showHideCommentBox() {
    if (widget.showCommentBox.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: FadeTransition(
        opacity: _animation,
        child: Builder(
          builder: (context) {
            return Align(
              alignment: Alignment.bottomCenter,
            );
          },
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _ProfileSlab(),
        _PictureCarousal(),
        _Description(),
        _InteractiveCommentSlab(),
      ],
    );
  }
}

class _PictureCarousal extends StatefulWidget {
  const _PictureCarousal({
    Key? key,
  }) : super(key: key);

  @override
  __PictureCarousalState createState() => __PictureCarousalState();
}

class __PictureCarousalState extends State<_PictureCarousal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._pictureCarousel(context),
        _likes(),
      ],
    );
  }

  /// Picture carousal and interaction buttons.
  List<Widget> _pictureCarousel(BuildContext context) {
    const iconPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
   double aspectRatio = 4 / 3;
    final iconColor = Theme.of(context).iconTheme.color!;
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child:Container(decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/farm1.png'),
                fit: BoxFit.fill
            )
          ),
              )
            ),
          ),
        ),
      ),
      Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: iconPadding,
            child: LikeButton(
              isLiked: true,
              onTap: (liked) {},
            ),
          ),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.chat_bubble_outline,
              color: iconColor,
            ),
          ),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.call_made,
              color: iconColor,
            ),
          ),
          const Spacer(),
          Padding(
            padding: iconPadding,
            child: Icon(
              Icons.bookmark_border,
              color: iconColor,
            ),
          ),
        ],
      )
    ];
  }

  Widget _likes() {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8),
      child: Text.rich(
        TextSpan(
          text: 'Liked by ',
          style: TextStyle(
            color: Colors.black87,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Ritik Agarwal',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Shagun Pandey',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(text: ' '),
            TextSpan(
              text: 'I am going to farm Potato, this weekend!',
            ),
          ],
        ),
      ),
    );
  }
}

class _InteractiveCommentSlab extends StatefulWidget {
  const _InteractiveCommentSlab({
    Key? key,
  }) : super(key: key);

  @override
  _InteractiveCommentSlabState createState() => _InteractiveCommentSlabState();
}

class _InteractiveCommentSlabState extends State<_InteractiveCommentSlab> {
  int get _commentCount => 10;

  @override
  Widget build(BuildContext context) {
    const textPadding = EdgeInsets.all(8);
    const spacePadding = EdgeInsets.only(left: 20.0, top: 8);
    final commentCount = _commentCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (commentCount > 0)
          const Padding(
            padding: spacePadding,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Anil Sharma',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'Wow, thats amazing :)',
                  ),
                ],
              ),
            ),
          ),
        if (commentCount > 1)
          const Padding(
            padding: spacePadding,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Rahul Shetty',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: '  '),
                  TextSpan(
                    text: 'Have a nice crop, buddy!',
                  ),
                ],
              ),
            ),
          ),
        if (commentCount > 2)
          Padding(
            padding: spacePadding,
            child: GestureDetector(
              onTap: () {
                // TODO
              },
              child: Text(
                'View all $commentCount comments',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 3, right: 8),
            child: Row(
              children: [
                const _ProfilePicture(),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Add a comment',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: textPadding,
                    child: Text('❤️'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: textPadding,
                    child: Text('🙌'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 4),
          child: Text(
            '2d ago',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserAvatar(radius: 20);
  }
}

class _ProfileSlab extends StatelessWidget {
  const _ProfileSlab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
      child: Row(
        children: [
          const UserAvatar(radius: 25),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Shivam Agarwal',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.more_horiz,
            color: Theme.of(context).iconTheme.color!,
          ),
        ],
      ),
    );
  }
}


class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.radius, this.imgUrl})
      : super(key: key);
  final double radius;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/person.png'),
    );
  }
}
class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.isLiked,
    this.size = 22,
    required this.onTap,
  }) : super(key: key);

  /// Indicates if it is liked or not.
  final bool isLiked;

  /// Size of the icon.
  final double size;

  /// onTap callback. Returns a value to indicate if liked or not.
  final Function(bool val) onTap;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
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
          color: Colors.red,
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