import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final Map<String, Object> barData;

  const ChartBar({Key? key, required this.barData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
              child: Text('\$${barData['value']}', style: Theme.of(context).textTheme.bodyMedium,),
          ),
        ),
        Container(
          width: 12,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            heightFactor: barData['percentage'] as double,
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
        Text(barData['day'] as String, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
