import 'package:event/event.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/protos/properties.pb.dart';

bool get isPro {
  return _proInfoAll.proInfoAf.isPro || _proInfoAll.proInfoPat.isPro;
}

var isProEx = 0;

ProInfoAf get proInfoAf => _proInfoAll.proInfoAf;
ProInfoPat get proInfoPat => _proInfoAll.proInfoPat;

final proEvent = Event();
late ProInfoAll _proInfoAll;

Future reloadIsPro() async {
  _proInfoAll = await methods.proInfoAll();
  isProEx = _proInfoAll.proInfoAf.expire.toInt();
  proEvent.broadcast();
}
