import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BeverageConfirmation extends StatelessWidget {
  final User user;
  final int totalSpending;
  final bool isExpanded;
  final Function()? onConfirm;
  final Function()? onCancel;

  const BeverageConfirmation({
    super.key,
    required this.user,
    required this.totalSpending,
    this.onConfirm,
    this.onCancel,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (isExpanded)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _spendingText(context),
                    ),
                    Flexible(
                      child: _buttons(context),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _spendingText(context),
                    const SizedBox(height: 8.0),
                    _buttons(context),
                  ],
                )),
    );
  }

  Widget _spendingText(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${AppLocalizations.of(context)!.selectionTotal}: "
            "$totalSpending",
          ),
          Text(user.name),
          Text(
            "${AppLocalizations.of(context)!.userBalance}: "
            "${user.balance}",
          ),
        ],
      );

  Widget _buttons(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buttonWrapper(
            TextButton(
              onPressed: () {
                onConfirm?.call();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Text(AppLocalizations.of(context)!.buttonConfirm),
            ),
            context,
          ),
          _buttonWrapper(
            TextButton(
              onPressed: () {
                onCancel?.call();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Text(AppLocalizations.of(context)!.buttonCancel),
            ),
            context,
          )
        ],
      );

  Widget _buttonWrapper(Widget widget, BuildContext context) {
    if (isExpanded) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget,
      );
    }
  }
}
