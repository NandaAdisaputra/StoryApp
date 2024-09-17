import 'package:storyappsdicoding/data/consts/constants.dart';

import 'base_url.dart' as base_url;

class PostRegister {
 String endPointRegister = "${base_url.base}/register";
}

class PostLogin {
  String endPointLogin = "${base_url.base}/login";
}

class GetStory {
   String endPointGetStory  = "${base_url.base}/stories";
}

class AddStory {
   String endPointAddStory = "${base_url.base}/stories";
}

class DetailStory {
  String endPointDetailStory(idStories) => "${base_url.base}/stories/$idStories";
}
// Local Storage Key
const String authDataKey = Constants.oAuthDataKeyStory;
const String loginDataKey = Constants.loginDataKeyStory;

final postRegister = PostRegister();
final postLogin = PostLogin();
final getStory= GetStory();
final postAddStory = AddStory();
final detailStory = DetailStory();
