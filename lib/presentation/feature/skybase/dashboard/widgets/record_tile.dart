import 'package:flutter/material.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class RecordTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final Color color;

  const RecordTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Row(
        children: [
          _icon(context),
          _text(context),
          Spacer(),
          _count(context),
        ],
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(Dimens.dimen_5),
      ),
      child: Icon(
        icon,
        color: color,
        size: 35,
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
          fontSize: Dimens.dimen_20,
            ),
      ),
    );
  }

  Widget _count(BuildContext context) {
    return Container(
      height: 102,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimens.dimen_10),
          bottomRight: Radius.circular(Dimens.dimen_10),
        ),
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.2),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        value.toString(),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: Dimens.dimen_28,
        )
      ),
    );
  }
}
