import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Slippage extends StatefulWidget {
  final TabController? tabController;
  const Slippage({super.key, required this.tabController});

  @override
  State<Slippage> createState() => _SlippageState();
}

class _SlippageState extends State<Slippage> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SliderTheme(
          data: SliderThemeData(
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              thumbColor: Colors.blueAccent,
              overlayColor: Colors.blue.withOpacity(0.2),
              tickMarkShape: RoundSliderTickMarkShape(),
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.blue,
              rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape()),
          child: Slider(
            divisions: 5,
            label: '${_value.round()}',
            value: _value,
            onChanged: (double newValue) {
              setState(() {
                _value = newValue;
              });
            },
            min: 0,
            max: 5,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {
              widget.tabController!.animateTo(1);
            },
            child: Text('done'),
          )
        ])
        /*Text(
          'Value: ${_value.toStringAsFixed(1)}',
          style: TextStyle(fontSize: 24),
        ),*/
      ],
    );
  }
}
