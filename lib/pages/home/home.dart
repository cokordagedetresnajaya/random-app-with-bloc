import 'package:bloc_architecture/data/models/data_home.dart';
import 'package:flutter/material.dart';
import '../../bloc/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomBloc randomBloc = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RANDOM APP',
        ),
      ),
      body: Center(
        child: BlocBuilder<RandomBloc, RandomState>(
          bloc: randomBloc,
          builder: (context, state) {
            if (state is RandomLoading) {
              return CircularProgressIndicator();
            }

            if (state is RandomError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something went wrong'),
                  Text(state.error),
                ],
              );
            }

            if (state is RandomInitial) {
              return Text('No Data');
            }

            DataHome dataHome = state.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: Container(
                    color: Colors.grey,
                    child: Image.network('${dataHome.profile}'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${dataHome.fullname}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${dataHome.email}',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('========== SPELL =========='),
                const SizedBox(
                  height: 20,
                ),
                Text('${dataHome.spell}'),
                const SizedBox(
                  height: 5,
                ),
                Text('Spell Type : ${dataHome.spellType}'),
                const SizedBox(
                  height: 5,
                ),
                Text('Spell Effect : ${dataHome.spellEffect}'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomBloc.add(GetRandomEvent());
          print(randomBloc.state.data.toJson());
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
