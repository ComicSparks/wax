import 'package:flutter/material.dart';
import 'package:wax/src/rust/api/types.dart';

import '../../basic/commons.dart';
import 'images.dart';

class ComicInfoCard extends StatelessWidget {
  final bool link;
  final ComicSimple comic;

  const ComicInfoCard(
    this.comic, {
    this.link = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontWeight: FontWeight.bold);
    final authorStyle = TextStyle(
      fontSize: 13,
      color: Colors.pink.shade300,
    );
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Card(
            child: ComicImage(
              url: comic.cover,
              width: 100 * coverWidth / coverHeight,
              height: 100,
            ),
          ),
          Container(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                link
                    ? GestureDetector(
                        onLongPress: () {
                          confirmCopy(context, comic.title);
                        },
                        child: Text(comic.title, style: titleStyle),
                      )
                    : Text(comic.title, style: titleStyle),
                Container(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
