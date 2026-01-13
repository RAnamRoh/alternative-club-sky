import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:sky_club/presentation/base/base_argument.dart';

class EditProfileArgument extends BaseArgument {
  // int id;
  // String name;
  //
  // HelloWorldArgument({required this.id, required this.name});

  final SkyUser user;
  EditProfileArgument({required this.user});
}
