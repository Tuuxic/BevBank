import 'package:bev_bank/components/cards/content_card.dart';
import 'package:flutter/material.dart';

class BeverageCard extends StatelessWidget {
  final String name;
  final int price;
  final int? volume;
  final String? subtype;
  final void Function()? onTap;
  const BeverageCard({
    super.key,
    required this.name,
    required this.price,
    this.volume,
    this.subtype,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Image.asset('assets/images/beverage.png'),
              const SizedBox(
                height: 100,
                width: 100,
                child: Placeholder(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(name),
                      Text(subtype ?? ""),
                    ],
                  ),
                  Column(
                    children: [
                      Text(_toPriceString(price)),
                      Text(_toVolumeString(volume)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  String _toPriceString(int? price) {
    if (price == null) return "";
    return "${price / 100}€";
  }

  String _toVolumeString(int? volume) {
    if (volume == null) return "";
    return "${volume / 100}l";
  }
}
