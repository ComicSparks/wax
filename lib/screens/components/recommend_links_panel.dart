import 'package:flutter/material.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/configs/recommend_links.dart';

class RecommendLinksPanel extends StatefulWidget {
  final EdgeInsetsGeometry padding;

  const RecommendLinksPanel({
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(0, 0, 0, 0),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecommendLinksPanelState();
}

class _RecommendLinksPanelState extends State<RecommendLinksPanel> {
  @override
  void initState() {
    recommendLinksEvent.subscribe(_setState);
    super.initState();
  }

  @override
  void dispose() {
    recommendLinksEvent.unsubscribe(_setState);
    super.dispose();
  }

  void _setState(_) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final links = currentRecommendLinks();
    if (links.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          ...links.entries.map((entry) {
            return ListTile(
              title: Text(entry.key),
              onTap: () => openUrl(entry.value),
            );
          }).toList(),
        ],
      ),
    );
  }
}

