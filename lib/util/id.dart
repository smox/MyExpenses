import 'package:uuid/data.dart';
import 'package:uuid/rng.dart';
import 'package:uuid/uuid.dart';

class Id {
  static final _uuid = Uuid(goptions: GlobalOptions(CryptoRNG()));
  static String now() => _uuid.v7(); // Zeit-sortierbar + CSPRN
}
