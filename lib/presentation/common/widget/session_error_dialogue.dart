import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class SessionErrorDialogue extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String buttonName;
  final VoidCallback onPressed;

  const SessionErrorDialogue({
    super.key,
    required this.iconData,
    required this.title,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  State<SessionErrorDialogue> createState() => _SessionErrorDialogueState();
}

class _SessionErrorDialogueState extends State<SessionErrorDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(Dimens.dimen_20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.iconData, size: Dimens.dimen_50.r, color: Colors.red),
            SizedBox(height: Dimens.dimen_16.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Dimens.dimen_16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimens.dimen_20.h),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                widget.onPressed();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dimen_8.r),
                ),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                widget.buttonName,
                style: TextStyle(
                  fontSize: Dimens.dimen_16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
