import 'package:equatable/equatable.dart';
import 'package:firstapp_bloc/model/user_model.dart';
import 'package:firstapp_bloc/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<UserEvent>((event, emit) async {
      try {
        emit(UserLoading());

        UserModel userList = await apiRepository.fetchCovidList();
        emit(UserLoaded(userList));

        if (userList.error != null) {
          emit(UserError(message: userList.error!));
        }
      }

      /// On Network Error
      on NetworkError {
        emit(const UserError(
          message: "Failed to fetch data. is your device online?",
        ));
      }
    });
  }
}
