import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/const.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rate',
              style: mystyle(17, Color(0Xff878787), FontWeight.w600),
            ),
            Text(
              '1 AVAX = 1.16 OKB',
              style: mystyle(14, Color(0XFFD9D9D9), FontWeight.w600),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Slippage tolerance',
                style: mystyle(15, Color(0Xff878787), FontWeight.w600)),
            Text(
              '1.29%',
              style: mystyle(14, Color(0XFFD9D9D9), FontWeight.w600),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Estimated Fees',
                style: mystyle(17, Color(0Xff878787), FontWeight.w600)),
            Text(
              '0.076 ETH',
              style: mystyle(14, Color(0XFFD9D9D9), FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
