import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/repositories/home_repository.dart';
import '../../data/models/data_home.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomRepository randomRepository;
  RandomBloc(this.randomRepository) : super(RandomInitial(DataHome())) {
    on<GetRandomEvent>((event, emit) async {
      try {
        emit(RandomLoading(state.data));
        Map<String, dynamic> randomData =
            await randomRepository.getRandomData();

        if (randomData['error'] == true) {
          String errorMessage = randomData['message'];
          emit(RandomError(state.data, errorMessage));
        } else {
          DataHome dataHome = randomData['data'];
          emit(RandomCompleted(dataHome));
        }
      } catch (e) {
        emit(RandomError(state.data, e.toString()));
      }
    });
  }
}
