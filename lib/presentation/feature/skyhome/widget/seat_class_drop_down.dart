import 'package:domain/enum/seat_class.dart';
import 'package:flutter/material.dart';
import 'package:club_alt/presentation/common/widget/asset_image_view.dart';
import 'package:club_alt/presentation/feature/skyhome/skyhome_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SeatClassDropDown extends StatelessWidget {
  final SkyhomeViewModel viewModel;

  const SeatClassDropDown({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dimen_7),
        border: Border.all(color: Color(0xFFB7B7B7), width: 1.5),
      ),
      child: ValueListenableBuilder(
        valueListenable: viewModel.seatClass,
        builder: (context, seatClass, _) {
          return DropdownButton<SeatClass>(
            value: seatClass,
            icon: AssetImageView(fileName: 'drop_down.svg', height: 33, width: 33,),
            isExpanded: true,
            underline: SizedBox.shrink(),
            onChanged: (SeatClass? newValue) {
              viewModel.updateSeatClass(newValue!);
            },
            items: SeatClass.values
                .map<DropdownMenuItem<SeatClass>>((SeatClass value) {
              return DropdownMenuItem<SeatClass>(
                value: value,
                child: Text(value.seatName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
