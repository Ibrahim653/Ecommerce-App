import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static LoginCubit get(context) => BlocProvider.of(context);

  bool autoLogin = false;

  autoLoginFun() {
    autoLogin = !autoLogin;
    emit(LoginState.authenticated(isLoggedIn: autoLogin));
  }

  void signout(BuildContext context) async {
    try {
      await CacheHelper.remove(Constants.username);
      await CacheHelper.remove(Constants.autoLogin).then((value) {
        return Navigator.pushNamed(context, Routes.loginScreen);
      });
    } catch (error) {
      emit(LoginState.error(error: error.toString()));
    }
  }

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        username: userNameController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await CacheHelper.saveString(
            Constants.accessToken, loginResponse.access);
        await CacheHelper.saveString(
            Constants.accessToken, loginResponse.refresh);
        autoLogin == true
            ? await CacheHelper.saveString(Constants.autoLogin, "autoLogin")
            : null;
        await CacheHelper.saveString(Constants.username, userNameController.text);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
