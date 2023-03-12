part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  const RandomState(this.data);

  final DataHome data;

  @override
  List<Object> get props => [data];
}

class RandomInitial extends RandomState {
  RandomInitial(DataHome data) : super(data);
}

class RandomLoading extends RandomState {
  RandomLoading(DataHome data) : super(data);
}

class RandomCompleted extends RandomState {
  RandomCompleted(DataHome data) : super(data);
}

class RandomError extends RandomState {
  RandomError(DataHome data, this.error) : super(data);
  String error;
}
