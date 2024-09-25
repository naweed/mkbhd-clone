import 'package:mkbhd_clone/services/mkbhd_api_service.dart';
import 'package:stacked/stacked.dart';

class AppViewModel extends BaseViewModel {
  late MKBHDApiService appApiService;

  String _title = "";
  String get Title => _title;
  set Title(String title) {
    _title = title;
  }

  bool _isBusy = false;
  bool get IsBusy => _isBusy;

  String _loadingText = "";
  String get LoadingText => _loadingText;
  set LoadingText(String loadingText) {
    _loadingText = loadingText;
  }

  bool _dataLoaded = false;
  bool get DataLoaded => _dataLoaded;
  set DataLoaded(bool dataLoaded) {
    _dataLoaded = dataLoaded;
  }

  bool _isErrorState = false;
  bool get IsErrorState => _isErrorState;
  set IsErrorState(bool isErrorState) {
    _isErrorState = isErrorState;
  }

  String _errorMessage = "";
  String get ErrorMessage => _errorMessage;
  set ErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
  }

  String _errorImage = "";
  String get ErrorImage => _errorImage;
  set ErrorImage(String errorImage) {
    _errorImage = errorImage;
  }

  void setDataLodingIndicators(bool isStaring) {
    if (isStaring) {
      _isBusy = true;
      _dataLoaded = false;
      _isErrorState = false;
      _errorMessage = "";
      _errorImage = "";
    } else {
      _loadingText = "";
      _isBusy = false;
    }

    rebuildUi();
  }
}
