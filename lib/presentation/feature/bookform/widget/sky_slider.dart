import 'package:flutter/material.dart';
import 'package:club_alt/presentation/feature/bookform/bookform_view_model.dart';
import 'package:club_alt/presentation/values/dimens.dart';

class SkySlider extends StatelessWidget {
  final BookformViewModel viewModel;

  const SkySlider({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '0',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Dimens.dimen_20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.zero,
            child: ValueListenableBuilder<double>(
              valueListenable: viewModel.sliderValue,
              builder: (context, value, _) {
                return SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Color(0xFF3F51B5).withOpacity(0.2),
                    inactiveTrackColor: Color(0xFF3F51B5).withOpacity(0.2),
                    thumbColor: Color(0xFF3F51B5),
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 555,
                    divisions: 555,
                    label: value.toStringAsFixed(0),
                    onChanged: (newValue) {
                      viewModel.updateSliderValue(newValue);
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Text(
          '555',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Dimens.dimen_20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
