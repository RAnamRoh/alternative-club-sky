import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/widget/asset_image_view.dart';
import 'package:sky_club/presentation/feature/skybase/reward/page/subscription_cancel/subscription_cancel_view_model.dart';
import 'package:sky_club/presentation/values/dimens.dart';


class SubCancelScreen extends StatelessWidget {

  final SubscriptionCancelViewModel viewModel;

  const SubCancelScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(Dimens.dimen_20).copyWith(
        top: Dimens.dimen_80,
      ),
      child: Center(
        child: Column(
          children: [
            AssetImageView(fileName: 'cancel_sub_img.svg', height: Dimens.dimen_160, width: Dimens.dimen_200,),
            SizedBox(height: Dimens.dimen_24,),
            Text(
              'Your Subscription Has Been Canceled.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: Dimens.dimen_18,
              ),

            ),
            SizedBox(height: Dimens.dimen_8,),
            Text(
              'We are sorry to see you go! Cancelling your subscription will stop future payments, but youll still have access to your plan until the end of the billing period. If there is anything we can do to improve your experience. let us know.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: Dimens.dimen_14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7F7F7F),
              ),
            ),
            SizedBox(height: Dimens.dimen_24,),
            _buildButton(context),


          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context){
    return ElevatedButton(
        onPressed: () async{
          // await viewModel.updateSubscription(false, null, null);
          //  viewModel.onViewReady(argument: null);
          //  viewModel.resetSubCancelled();
         // viewModel.navigateHome();
          Navigator.pop(context);
        },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_24, vertical: Dimens.dimen_12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dimen_8),
        ),
        minimumSize: Size(double.infinity, 40),
      ),
        child: Text(
          'Back To Rewards',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_14,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
    );
  }

}
