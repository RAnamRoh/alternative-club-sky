import 'package:domain/model/skyClubModels/offer_domain.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/base/screen_util/screen_util_builder.dart';
import 'package:sky_club/presentation/common/widget/primary_button.dart';
import 'package:sky_club/presentation/feature/explore/explore_view_model.dart';
import 'package:sky_club/presentation/feature/explore/util/json_text_converter.dart';
import 'package:sky_club/presentation/values/dimens.dart';



class DiscoverLocation extends StatelessWidget {

  final ExploreViewModel viewModel;

  const DiscoverLocation({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ValueListenableBuilder(
            valueListenable: viewModel.offerList,
            builder: (context, offerList, _) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerList.length,
                itemBuilder: (context, index){
                  return
                  _locationElement(context: context, offfer: offerList[index]);
                },
              );
            }
        ),
      ),
    );
  }

  Widget _locationCard({required BuildContext context, required OfferDomain offer}) {
    return Container(
      width: 215.w,
      height: 265.h,
      padding: EdgeInsets.all(Dimens.dimen_8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.dimen_10.r),
            child: Stack(
              children: [
                Image.network(
                  height: Dimens.dimen_134.h,
                  width: double.infinity.w,
                  offer.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.broken_image,
                        size: Dimens.dimen_50.r,
                        color: Colors.grey.shade400,
                      ),
                    );
                  },
                ),
                Padding(
                  padding:  EdgeInsets.all(Dimens.dimen_15.r),
                  child: Text(
                    offer.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Dimens.dimen_20.sp,
                    )
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimens.dimen_8.h),
          Text(
            offer.subTitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: Dimens.dimen_8),
          Text(
            JsonTextConverter.extractDescriptionText(offer.description),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _locationElement({required BuildContext context, required OfferDomain offfer}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.dimen_10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _locationCard(context: context, offer: offfer),
          Transform(
            transform: Matrix4.translationValues(0, -25, 0),
            child: ElevatedButton(
              onPressed: () {
                print("Search Pressed");

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: Size(Dimens.dimen_140.w, Dimens.dimen_40.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
                ),
              ),
              child: Text(
                "Learn More",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Dimens.dimen_16.sp,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }






}
