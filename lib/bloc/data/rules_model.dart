import 'package:hive_flutter/adapters.dart';
part 'rules_model.g.dart';

@HiveType(typeId: 0)
class The48RulesModel extends HiveObject {
  @HiveField(0)
  late bool isFavorite;
}
