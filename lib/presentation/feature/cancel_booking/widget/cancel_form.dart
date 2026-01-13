import 'dart:io';

import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/cancel_booking/cancel_booking_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class CancelForm extends StatefulWidget {
  final CancelBookingViewModel viewModel;

  const CancelForm({required this.viewModel, super.key});

  @override
  State<CancelForm> createState() => _CancelFormState();
}

class _CancelFormState extends State<CancelForm> {
  final List<String> _reasonList = [
    '',
    'Personal',
    'Medical',
    'Technical',
    'Other'
  ];

  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectReason(context),
            SizedBox(height: Dimens.dimen_20),
              _buildDescription(context),
            SizedBox(height: Dimens.dimen_20),
            _buildUploadButton(context),
            SizedBox(height: Dimens.dimen_20),
            _buildFileList(context)

          ],
        ),
      ),
    );
  }

  Widget _buildSelectReason(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reason for Cancel',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.dimen_7),
            border: Border.all(color: Color(0xFFB7B7B7), width: 1.5),
            color: Colors.white,
          ),
          child: ValueListenableBuilder(
            valueListenable: widget.viewModel.selectedReason,
            builder: (context, selectedReason, _) {
              return DropdownButton<String>(
                value: selectedReason,
                icon: AssetImageView(
                  fileName: 'drop_down.svg',
                  height: 33,
                  width: 33,
                ),
                isExpanded: true,
                underline: SizedBox.shrink(),
                onChanged: (String? newValue) {
                  widget.viewModel.updateSelectedReason(newValue!);
                  setState(() {}); // Rebuild the widget to show/hide the description field
                },
                items: _reasonList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value.isEmpty ? 'Select a reason' : value,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: value.isEmpty ? Color(0xFF9B9B9B) : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type Reason',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.dimen_7),
            border: Border.all(color: Color(0xFFB7B7B7), width: 1.5),
            color: Colors.white,
          ),
          child: TextField(
            controller: widget.viewModel.cancelReasonController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Type Reason',
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Color(0xFFB7B7B7),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(Dimens.dimen_12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
widget.viewModel.selectFiles();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF3F6FD), // Use a red color for cancellation
          padding: EdgeInsets.symmetric(vertical: Dimens.dimen_16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_7),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, color: Colors.grey,),
            SizedBox(width: Dimens.dimen_5,),
            Text(
              'Browse',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildFileList(BuildContext context){
    return  Expanded(
      child: ValueListenableBuilder<List<File>>(
        valueListenable: widget.viewModel.selectedFiles,
        builder: (context, files, child) {

          bool isVisible = !files.any((element) => element.path.contains('dummy'));


          return isVisible ? ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {

              return ListTile(
                title: Text(files[index].path.split('/').last),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => widget.viewModel.removeFile(index),
                ),
              );
            },
          ) : SizedBox.shrink();
        },
      ),
    );
  }


}