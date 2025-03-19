import 'package:bloc/bloc.dart';
import 'package:code_base/models/user/user.dart';
import 'package:code_base/pages/user_page/bloc/user_state.dart';

import '../../../repositories/user_repository.dart';

class UserBloc extends Cubit<UserState> {
  final IUserRepository _repository;
  UserBloc(this._repository) : super(UserInitialState());
  List<User> listUser = [];

  Future fetchListUser()async{
    final request = await _repository.fetchListUser();
    request.fold(
      success: (response) {
        final data = response.data;
        if(data != null){
          listUser.addAll(data);
          emit(GetUserListSuccess());
        }
        emit(GetUserListFailed());
      },
      error: (error) => emit(GetUserListFailed()),
    );
  }
}
