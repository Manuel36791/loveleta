import 'package:flutter/material.dart';
import 'package:loveleta/core/utils/extensions.dart';

import '../../../../../../core/utils/dimensions.dart';
import '../../../../../core/database/address_class.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/shared/arguments.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class SavedAddressItem extends StatelessWidget {
  final Address address;

  const SavedAddressItem({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          paymentSummaryPageRoute,
          arguments: PaymentSummaryArgs(address: address),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(Dimensions.p16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).address}:",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.address.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).buildingNo}:",                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.building.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).flatNo}:",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.flat.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).country}:",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.country.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).city}:",
                  style: CustomTextStyle.kTextStyleF16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    address.city.isNullOrEmpty(),
                    style: CustomTextStyle.kTextStyleF16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
