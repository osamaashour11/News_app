import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit2/state.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit2 extends Cubit<AppState2> {
  AppCubit2() : super(InitialAppState2());

  static AppCubit2 get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? dark}) {
    if (dark != null){
      isDark = dark;
    }
    else {
      isDark = !isDark;
      emit(ChangeModeApp());
    }
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeModeApp());
    });
  }
}
