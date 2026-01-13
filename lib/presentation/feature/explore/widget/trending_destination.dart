import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:club_alt/presentation/base/screen_util/screen_util_builder.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class TrendingDestination extends StatelessWidget {
  const TrendingDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Trending',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  Text(
                    ' Destinations',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                ],
              ),
              Text(
                'this Summer',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.grey.shade700,
                    ),
              )
            ],
          ),
          SizedBox(
            height: Dimens.dimen_5.h,
          ),
          Column(
            children: [
              Text(
                'Book Your Next Adventure Today!',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                      fontSize: Dimens.dimen_15.sp,
                    ),
              ),
              Text(
                'Affordable Flight to YOur Dream Destinations.',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                      fontSize: Dimens.dimen_15.sp,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: Dimens.dimen_10.h,
          ),
          ElevatedButton(
            onPressed: () {
              print("Call Us Pressed");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              minimumSize: Size(double.infinity, Dimens.dimen_40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.dimen_5.r),
              ),
            ),
            child: Text(
              "Call Us",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
