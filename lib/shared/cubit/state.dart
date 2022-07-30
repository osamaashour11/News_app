abstract class AppState {}

class InitialAppState extends AppState {}

class ChangeBottomNavBarAppState extends AppState {}

class LoadingBusinessData extends AppState {}

class GetSuccessBusinessData extends AppState {
}

class GetErrorBusinessData extends AppState {
  final String error;
  GetErrorBusinessData(this.error);
}

class GetSuccessScienceData extends AppState {

}

class LoadingScienceData extends AppState {}

class GetErrorScienceData extends AppState {
  final String error;
  GetErrorScienceData(this.error);
}

class GetSuccessSportData extends AppState {
}

class LoadingSportData extends AppState {}

class GetErrorSportData extends AppState {
  final String error;
  GetErrorSportData(this.error);
}

class LoadingSearchData extends AppState {}

class GetSuccessSearchData extends AppState {}

class GetErrorSearchData extends AppState {
  final String error;
  GetErrorSearchData(this.error);
}
