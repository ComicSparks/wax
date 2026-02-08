import 'package:event/event.dart';
import 'package:wax/basic/methods.dart';

var recommendLinksEvent = Event<EventArgs>();

Map<String, String> _recommendLinks = {};

Map<String, String> currentRecommendLinks() => _recommendLinks;

Future<void> initRecommendLinks() async {
  try {
    _recommendLinks = await methods.configLinks();
  } catch (_) {
    _recommendLinks = {};
  }
  recommendLinksEvent.broadcast();
}

