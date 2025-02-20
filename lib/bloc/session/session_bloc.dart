import 'package:bloc/bloc.dart';

import '../../core/di/injection.dart';
import '../../core/events/session_expired_event.dart';
import '../../core/events/session_logout_event.dart';
import '../../core/helpers/event_bus.dart';
import 'session_state.dart';

class SessionBloc extends Cubit<SessionState> {
  final _eventBus = getIt<EventBus>();

  SessionBloc() : super(SessionInitial()) {
    _eventBus.on<SessionLogoutEvent>().listen((_) {
      emit(SessionLogout());
    });
    _eventBus.on<SessionExpiredEvent>().listen((_) {
      emit(SessionExpired());
    });
  }
}
