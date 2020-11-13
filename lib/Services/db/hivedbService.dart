import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:github_Api/Global/Gobal.dart';

class HiveDbService extends GetxService {
  Future init() async {
    final hiveDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(hiveDir.path);
    box = await Hive.openBox('HiveCacheBox');
    
    print("Hive Started");
  }
}
