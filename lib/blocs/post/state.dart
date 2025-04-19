part of 'bloc.dart';

@immutable
class PostState extends Equatable {
  final PostTestState? test;
  const PostState({this.test});

  PostState copyWith({PostTestState? test}) {
    return PostState(test: test ?? this.test);
  }

  @override
  List<Object?> get props => [test];
}

final class PostInitial extends PostState {
  const PostInitial() : super(test: const PostTestState());
}
