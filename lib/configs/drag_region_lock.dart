import '../basic/methods.dart';

const _propertyName = "dragRegionLock";

late bool _dragRegionLock;

Future initDragRegionLock() async {
  final value = await methods.loadProperty(k: _propertyName);
  _dragRegionLock = value == "" ? true : value == "true";
}

bool get dragRegionLock => _dragRegionLock;

Future<void> setDragRegionLock(bool value) async {
  await methods.saveProperty(k: _propertyName, v: "$value");
  _dragRegionLock = value;
}
