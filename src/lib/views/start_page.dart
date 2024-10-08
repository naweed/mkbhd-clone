import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mkbhd_clone/controls/extensions/padding_extensions.dart';
import 'package:mkbhd_clone/controls/shared/error_indicator.dart';
import 'package:mkbhd_clone/controls/shared/loading_indicator.dart';
import 'package:mkbhd_clone/shared/app_colors.dart';
import 'package:mkbhd_clone/shared/app_styles.dart';
import 'package:mkbhd_clone/viewmodels/start_page_view_model.dart';
import 'package:mkbhd_clone/views/image_details_page.dart';
import 'package:stacked/stacked.dart';

class StartPage extends StackedView<StartPageViewModel> {
  late StartPageViewModel pageViewModel;

  StartPage({super.key});

  @override
  StartPageViewModel viewModelBuilder(BuildContext context) {
    pageViewModel = StartPageViewModel();
    return pageViewModel;
  }

  @override
  void onViewModelReady(StartPageViewModel viewModel) async {
    await viewModel.loadWallpapers();
  }

  @override
  Widget builder(BuildContext context, StartPageViewModel viewModel, Widget? child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppStyles.getPageAppBar(viewModel.Title),
        body: _buildUI(context),
      );

  Widget _buildUI(BuildContext context) {
    //Show Error Indicator
    if (pageViewModel.IsErrorState) {
      return ErrorIndicator(errorText: pageViewModel.ErrorMessage);
    }

    //Show Loading Indicator
    if (pageViewModel.IsBusy) {
      return LoadingIndicator(loadingText: pageViewModel.LoadingText);
    }

    //Show UI
    if (pageViewModel.DataLoaded) {
      return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          var image = pageViewModel.Wallpapers[index];

          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ImageDetailsPage(imageUrl: image))),
            child: AspectRatio(
              aspectRatio: 1 / 1.76,
              child: Container(
                padding: 4.withAllPadding(),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.LightIndicatorColor.withOpacity(0.5), width: 0.75),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.PageBackgroundColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[900],
                      child: const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.LightIndicatorColor,
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ).withLTRBPadding(0, index == 1 ? 32 : 0, 0, 0);
        },
        itemCount: pageViewModel.Wallpapers.length,
      ).withLTRBPadding(16, 0, 16, 0);
    }

    //Show Empty Page
    return Container();
  }
}
