

abstract class AppStates{}

class AppInitialState extends AppStates{}

class ChangeBottomNavBarState extends AppStates{}

class AppLoadingHomeState extends AppStates{}

class AppSuccessHomeState extends AppStates{}

class AppErrorHomeState extends AppStates{}

class AppSuccessCategoriesState extends AppStates{}

class AppErrorCategoriesState extends AppStates{}

class AppFavoritesState extends AppStates{}

class AppFavoritesLoadingState extends AppStates{}

class AppSuccessFavoritesState extends AppStates{

 // final ChangeFavoritesModel model;

  AppSuccessFavoritesState();
}

class AppErrorFavoritesState extends AppStates{
  final error;

  AppErrorFavoritesState(this.error);
}
class AppLoadingGetFavoritesState extends AppStates{}

class AppGetFavoritesSuccessState extends AppStates{}

class AppGetFavoritesErrorState extends AppStates{

  final error;
  AppGetFavoritesErrorState(this.error);
}

class AppLoadingGetUserDataState extends AppStates{}

class AppGetUserDataSuccessState extends AppStates{
  //final LoginModel loginModel;

  AppGetUserDataSuccessState();
}

class AppGetUserDataErrorState extends AppStates{

  final error;
  AppGetUserDataErrorState(this.error);
}


class AppLoadingUpdateUserDataState extends AppStates{}

class AppUpdateUserDataSuccessState extends AppStates{
  //final LoginModel loginModel;

  AppUpdateUserDataSuccessState();
}

class AppUpdateUserDataErrorState extends AppStates{

  final error;
  AppUpdateUserDataErrorState(this.error);
}




