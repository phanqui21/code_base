import 'package:bloc/bloc.dart';
import 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashInitial());
}
