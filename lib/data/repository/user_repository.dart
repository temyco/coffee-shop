import 'dart:math';

import 'package:flutterapp/data/model/achievement.dart';
import 'package:flutterapp/data/model/user.dart';
import 'package:flutterapp/resources/app_images.dart';

class UserRepository {
  Future<User> getUserProfile() async {
    //execute action with small pause to see loading state
    return Future.delayed(Duration(seconds: 2), () => _generateTestUser());
  }

  User _generateTestUser() {
    User user = User();
    user.name = 'Alex Banner';
    user.completedStepsToFreeCoffee = 2;
    user.requiredStepsToFreeCoffee = 5;
    user.level = 3;
    user.currentLevelExperience = 240;
    user.maxLevelExperience = 500;
    user.picture = AppImages.userAvatar;

    user.achievements = List();

    var random = Random();
    for(int i = 0; i < 25; i++) {
      Achievement achievement = Achievement();
      achievement.name = 'Achievement $i';

      var randomType = random.nextInt(3);
      switch(randomType) {
        case 0:
          achievement.type = 'Daily';
          break;
        case 1:
          achievement.type = 'Random';
          break;
        case 2:
          achievement.type = 'Boss';
          break;
      }
      achievement.level = random.nextInt(3);

      var maxProgress = random.nextInt(50);
      if(maxProgress == 0) {
        maxProgress = 15;
      }
      achievement.maxProgress = maxProgress;
      achievement.currentProgress = random.nextInt(maxProgress);

      user.achievements.add(achievement);
    }

    return user;
  }
}