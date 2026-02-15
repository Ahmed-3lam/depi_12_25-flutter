import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";
  static const loginBox = "loginBox";

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


   static void setLoginBox() {
    Hive.box(loginBox).put(loginBox, true);
  }

 static bool getLoginBox() {
    if (Hive.box(loginBox).isNotEmpty) {
      return Hive.box(loginBox).get(loginBox);
    } else {
      return false;
    }
  }
}


/// MVVM , MVC 
