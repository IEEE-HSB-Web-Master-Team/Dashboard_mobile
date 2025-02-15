import 'package:bloc/bloc.dart';
import 'package:dash_board_ieee/core/network/api_result.dart';
import 'package:dash_board_ieee/core/network/error/error_handler.dart';
import 'package:dash_board_ieee/core/network/error/error_model.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/login_response_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/use_cases/auth_use_case.dart';
import 'package:dash_board_ieee/features/Auth/presentation/viewModel/auth_actions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/request/login_request_entity.dart';

part 'auth_view_model_state.dart';

@injectable
class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  final AuthUseCase _useCase;
  String? selectedGender="male";

  @factoryMethod
  AuthViewModelCubit(this._useCase) : super(AuthViewModelInitial());

  void doAction(AuthActions action) {
    switch (action) {
      case LoginAction():
        _login(action.request);
        case SignupAction():
        _signup(action.request);
    }
  }

  Future<void> _login(LoginRequestEntity request) async {
    emit(LoginLoadingState());
    final result = await _useCase.login(request);
    switch (result) {
      case Success<LoginResponseEntity>():
        emit(LoginSuccessState(result.data));
        break;
      case Fail<LoginResponseEntity>():
        emit(LoginErrorState(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
  _signup(SignupReqestEtity request) async {
    emit(SignupLoadingState());
    final result = await _useCase.signup(request);
    switch (result) {
      case Success<SignupResponseEntity>():
        emit(SignupSuccessState(result.data));
        break;
      case Fail<SignupResponseEntity>():
        emit(SignupErrorState(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
