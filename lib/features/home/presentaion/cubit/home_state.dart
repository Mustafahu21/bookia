class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String error;
  HomeFailureState(this.error);
}
