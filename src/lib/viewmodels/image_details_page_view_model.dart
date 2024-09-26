import 'package:mkbhd_clone/viewmodels/app_view_model.dart';

class ImageDetailsPageViewModel extends AppViewModel {
  final String imageUrl;

  ImageDetailsPageViewModel(this.imageUrl) : super() {
    Title = "WALLPAPER";
  }
}
