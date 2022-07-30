import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/modules/splach/splach_screen.dart';
import 'package:news_app/shared/constants/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit2/cubit.dart';
import 'package:news_app/shared/cubit2/state.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getBusinessData(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                AppCubit2()..changeAppMode(dark: isDark)),
      ],
      child: BlocConsumer<AppCubit2, AppState2>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit2.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
