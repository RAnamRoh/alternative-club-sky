

import 'dart:io';

import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/bookedFlightInfo.dart';
import 'package:domain/repository/booking_details_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_argument.dart';
import 'package:club_alt/presentation/feature/bookingdetails/page/ticket_cancel/route/ticket_cancel_route.dart';
import 'package:club_alt/presentation/feature/cancel_booking/route/cancel_booking_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';
import 'package:club_alt/presentation/util/value_notifier_list.dart';

class CancelBookingViewModel extends BaseViewModel<CancelBookingArgument> {


  final ValueNotifier<String> selectedReason = ValueNotifier('');
  final TextEditingController cancelReasonController = TextEditingController();

  final ValueNotifierList<File> selectedFiles = ValueNotifierList<File>([]);
  late String bookingId;
  late BookedFlightInfo flightInfo;

  final BookingDetailsRepository bookingRepository;

  CancelBookingViewModel({required this.bookingRepository});

  @override
  void onViewReady({CancelBookingArgument? argument}) {
    super.onViewReady();
    bookingId = argument!.bookingId;
    flightInfo = argument.flightInfo;
  }


  void updateSelectedReason(String reason) {
    selectedReason.value = reason;
  }

  void cancelBooking() async{
    if (selectedReason.value.isEmpty) {
      showToast(uiText: FixedUiText(text: 'Please Select a Reason'));
      return;
    }

    if (cancelReasonController.value.text.isEmpty) {
      showToast(uiText: FixedUiText(text: 'Please Provide a Description'));
      return;
    }

    await ensureFilesSelected();


    final bool response = await loadData(() => bookingRepository.cancelBooking(bookingId: bookingId, reason: selectedReason.value, comment: cancelReasonController.value.text, files: selectedFiles.value)) ;
    // showLoadingDialog();
    // final bool response = await bookingRepository.cancelBooking(bookingId: bookingId, reason: selectedReason.value, comment: cancelReasonController.value.text, files: selectedFiles.value);
    // dismissLoadingDialog();dismissLoadingDialog

    if(response){
      showToast(uiText: FixedUiText(text: 'Booking Cancelled Successfully'));
      navigateToScreen(destination: TicketCancelRoute(arguments: TicketCancelArgument(flightInfo: flightInfo)), isClearBackStack: true);
    }else{
      showToast(uiText: FixedUiText(text: 'Failed to Cancel Booking'));
      navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);
    }


  }

  Future<void> selectFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null) {
      selectedFiles.addAll(result.paths.map((path) => File(path!)).toList());
    }
  }

  void removeFile(int index) {
    selectedFiles.removeAt(index);
  }

  /// Ensures that at least one file is present. If empty, it adds a dummy file.
  Future<void> ensureFilesSelected() async {
    if (selectedFiles.value.isEmpty) {
      File dummyFile = await _createDummyFile();
      selectedFiles.add(dummyFile);
    }
  }

  /// Creates a dummy file in the temporary directory
  Future<File> _createDummyFile() async {
    final tempDir = await getTemporaryDirectory();
    final dummyFile = File('${tempDir.path}/dummy_file.txt');
    await dummyFile.writeAsString('This is a dummy file required for upload.');
    return dummyFile;
  }

  void onDismissClicked(){
    navigateBack();
  }

}
