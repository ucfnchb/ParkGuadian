import 'package:hive_flutter/hive_flutter.dart';


extension AppHiveInst on HiveInterface {
  static const String _boxName = "app_park";

  initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  Future<void> putData(Map<String, dynamic> data) async {
    List<Map<String, dynamic>> dataList = getData();
    dataList.add(data);
    return await Hive.box(_boxName).put('data', dataList);
  }

  List<Map<String, dynamic>> getData() {
    List<Map<String, dynamic>> dataMapList = Hive.box(_boxName)
        .get('data', defaultValue: <Map<String, dynamic>>[]).cast<Map<String, dynamic>>();
    return dataMapList;
  }

}
