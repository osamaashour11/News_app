import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sport/sport_screen.dart';
import 'package:news_app/shared/cubit/state.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

// Variables
  int currentIndex = 0;
// Lists
  List<String> titles = [
    'Business',
    'Science',
    'Sport',
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball_outlined),
      label: 'Sports',
    ),
  ];

  List<Widget> appBarActions = [
    IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
    IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode_outlined)),
    IconButton(onPressed: () {}, icon: const Icon(Icons.language_outlined)),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportScreen(),
  ];

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sport = [];
  List<dynamic> search = [];

// Methods
  void changeBottomNavBar(index) {
    currentIndex = index;
    if (index == 1) getScienceData();
    if (index == 2) getSportData();
    emit(ChangeBottomNavBarAppState());
  }

  void getBusinessData() {
    if (business.length > 0 || business.length == 0) {
      emit(LoadingBusinessData());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'au',
          'category': 'business',
          'apiKey': '6c42c3d67ed24b269db1b8111988fa7a',
        },
      ).then((value) {
        emit(GetSuccessBusinessData());
        business = value.data['articles'];
      }).catchError((error) {
        emit(GetErrorBusinessData(error));
      });
    } else {
      emit(GetSuccessBusinessData());
    }
  }

  void getScienceData() {
    if (science.length > 0 || science.length == 0) {
      emit(LoadingScienceData());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'au',
          'category': 'science',
          'apiKey': '6c42c3d67ed24b269db1b8111988fa7a',
        },
      ).then((value) {
        emit(GetSuccessScienceData());
        science = value.data['articles'];
      }).catchError((error) {
        print(error);
        emit(GetErrorScienceData(error.toString()));
      });
    } else {
      emit(GetSuccessScienceData());
    }
  }

  void getSportData() {
    if (sport.length > 0 || sport.length == 0) {
      emit(LoadingSportData());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'au',
          'category': 'sport',
          'apiKey': '6c42c3d67ed24b269db1b8111988fa7a',
        },
      ).then((value) {
        emit(GetSuccessSportData());
        sport = value.data['articles'];
      }).catchError((error) {
        print(error);
        emit(GetErrorSportData(error.toString()));
      });
    } else {
      emit(GetSuccessSportData());
    }
  }

  void getSearchData(value) {
    emit(LoadingSearchData());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '6c42c3d67ed24b269db1b8111988fa7a',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(GetSuccessSearchData());
    }).catchError((error) {
      emit(GetErrorSearchData(error.toString()));
    });
  }
}
