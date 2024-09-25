import 'package:mkbhd_clone/services/mkbhd_api_service.dart';
import 'package:mkbhd_clone/shared/app_constants.dart';
import 'package:mkbhd_clone/viewmodels/app_view_model.dart';

class StartPageViewModel extends AppViewModel {
  late List<String> _wallpapers;
  List<String> get Wallpapers => _wallpapers;

  StartPageViewModel() : super() {
    Title = AppConstants.ApplicationName;
    appApiService = MKBHDApiService();
  }

  Future<void> loadWallpapers() async {
    LoadingText = "Hold on while we get the Wallpapers from MKBHD app for you...";
    setDataLodingIndicators(true);

    try {
      //Get list of Wallpapers
      _wallpapers = await appApiService.getWallpapers();

      DataLoaded = true;
    } catch (ex) {
      IsErrorState = true;
      ErrorMessage = "Something went wrong. If the problem persists, plz contact support at ${AppConstants.SupportEmailAddress} ${ex.toString()}.";
    } finally {
      setDataLodingIndicators(false);
    }
  }
}
