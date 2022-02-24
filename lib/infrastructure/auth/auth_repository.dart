import 'package:injectable/injectable.dart';
import 'package:template_project/domain/auth/i_auth_repository.dart';

@Singleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {

  @override
  bool isLogin() {
    //TODO: logic login here
    return true;
  }

  @override
  void getSystemParameter() {
    // TODO: implement getSystemParameter
  }
}
