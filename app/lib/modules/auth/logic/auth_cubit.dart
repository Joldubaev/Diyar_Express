import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<int> {
  AuthCubit() : super(0);

  void change(int v) => v != state ? emit(v) : {};
  
  bool get isAuthedticated => state == 1;
}
