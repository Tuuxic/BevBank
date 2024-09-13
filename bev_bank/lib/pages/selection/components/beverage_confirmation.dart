import 'package:bev_bank/components/cards/content_card.dart';
import 'package:bev_bank/domain/models/user.dart';
import 'package:bev_bank/util/screen_size_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BeverageConfirmation extends StatelessWidget {
  final User user;
  final int totalSpending;
  const BeverageConfirmation(
      {super.key, required this.user, required this.totalSpending});

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _contentWrapper(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          context,
          [
            Expanded(
              child: Column(
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
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child:
                            Text(AppLocalizations.of(context)!.buttonConfirm),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.buttonCancel),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentWrapper(BuildContext context, List<Widget> children) {
    bool isMobile = ScreenSizeDetection.isMobile(context);

    if (isMobile) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }
  }
}
