import 'package:flutter/material.dart';
import 'package:wax/src/rust/api/types.dart';

import '../../basic/commons.dart';
import 'images.dart';

// todo 加载本地cover
// todo 显示下载状态和进度
class DownloadInfoCard extends StatelessWidget {
  final bool link;
  final ComicDownloadDto comic;

  const DownloadInfoCard(
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
                Row(children: [
                  Text(
                    comic.deleting
                        ? "删除中"
                        : comic.status == 2
                        ? "下载失败"
                        : comic.status == 1
                        ? "下载成功"
                        : "下载中",
                    style: TextStyle(
                      color: comic.deleting
                          ? Colors.red
                          : comic.status == 2
                          ? Colors.red
                          : comic.status == 1
                          ? Colors.green
                          : Colors.blue,
                    ),
                  ),
                  Container(width: 14),
                  Text("${comic.pageDown} / ${comic.pageCount}"),
                ]),
                Container(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
