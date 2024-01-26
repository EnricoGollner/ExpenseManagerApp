import 'package:expenses_manager_app/src/core/colors.dart';
import 'package:expenses_manager_app/src/core/fonts.dart';
import 'package:expenses_manager_app/src/core/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar(
      {super.key,
      required this.label,
      required this.value,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(child: Text(Formatters.doubleToCurrency(value), style: chartValueStyle))),
        const SizedBox(height: 5),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorSecondary, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: colorGrey.withOpacity(0.4),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colorSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: chartLabelStyle)
      ],
    );
  }
}
