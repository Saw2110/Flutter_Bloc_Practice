part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

/// Initial State
class UserInitial extends UserState {}

/// While Data Loading
class UserLoading extends UserState {}

/// After Data Loaded
class UserLoaded extends UserState {
  final UserModel userModel;
  const UserLoaded(this.userModel);
}

/// For Error
class UserError extends UserState {
  final String message;
  const UserError({required this.message});
}
