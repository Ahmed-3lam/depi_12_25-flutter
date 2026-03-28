import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";
  static const tokenBox = "token";

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


   static void setTokenBox(String token) {
    Hive.box(tokenBox).put(tokenBox, token);
  }

 static String? getTokenBox() {
    if (Hive.box(tokenBox).isNotEmpty) {
      return Hive.box(tokenBox).get(tokenBox);
    } else {
      return null;
    }
  }
}


/// MVVM , MVC 
