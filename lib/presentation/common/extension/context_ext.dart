import 'package:flutter/material.dart';
import 'package:club_alt/presentation/localization/generated/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
