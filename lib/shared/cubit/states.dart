abstract class AppStates {}
class AppInitialState extends AppStates {}

class AppChangeBottomState extends AppStates {}
class AppChangeOpenPagesState extends AppStates {}


// class AppGetLearningLoadingState extends AppStates {}
//
// class AppGetLearningSuccessState extends AppStates {}
//
// class AppGetLearningErrorState extends AppStates {
//   final String error;
//   AppGetLearningErrorState(this.error);
// }
//
//
// class AppGetOpenLearnLoadingState extends AppStates {}
//
// class AppGetOpenLearnSuccessState extends AppStates {}
//
// class AppGetOpenLearnErrorState extends AppStates {
//   final String error;
//   AppGetOpenLearnErrorState(this.error);
// }
//
//
// class AppGetMyPageLoadingState extends AppStates {}
//
// class AppGetMyPageLoadingSuccessState extends AppStates {}
//
// class AppGetMyPageLoadingErrorState extends AppStates {
//   final String error;
//   AppGetMyPageLoadingErrorState(this.error);
// }