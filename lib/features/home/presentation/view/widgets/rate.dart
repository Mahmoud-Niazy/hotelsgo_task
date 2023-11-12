import 'package:flutter/material.dart';

class Rate extends StatefulWidget {
  final num rate;

  const Rate({
    super.key,
    required this.rate
  });

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 100,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: widget.rate >= index+1 ? const Color(0xFF005F00) : Colors.grey,
              size: 20,
            ),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
