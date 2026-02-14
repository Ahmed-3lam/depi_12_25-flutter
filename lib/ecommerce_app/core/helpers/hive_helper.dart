import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";

  static void setOnboardingBoxValue() {
    Hive.box(onboardingBox).put(onboardingBox, true);
  }

 static bool getOnboardingBoxValue() {
    if (Hive.box(onboardingBox).isNotEmpty) {
      return Hive.box(onboardingBox).get(onboardingBox);
    } else {
      return false;
    }
  }
}


/// MVVM , MVC 
