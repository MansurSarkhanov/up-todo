import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Cubit<int> {
  MainBloc() : super(0);

  void changePage(int index) => emit(index);
}
