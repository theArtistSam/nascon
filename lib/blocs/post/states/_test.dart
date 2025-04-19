part of '../bloc.dart';

@immutable
class PostTestState extends Equatable {
  static bool match(PostState a, PostState b) => a.test != b.test;

  final String? message;

  const PostTestState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class PostTestDefault extends PostTestState {
  const PostTestDefault();
}

@immutable
class PostTestLoading extends PostTestState {
  const PostTestLoading();
}

@immutable
class PostTestSuccess extends PostTestState {
  const PostTestSuccess();
}

@immutable
class PostTestFailure extends PostTestState {
  const PostTestFailure({required String message}) : super(message: message);
}
