import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

import 'package:circular_menu/mocks/mocks.dart';
import 'package:circular_menu/widgets/menu_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animatedAngle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animatedAngle = Tween<double>(begin: math.pi, end: 0).animate(_controller);

    _animatedAngle.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final decoratorWidth = size.width * 0.8;
    final outDecoratorWidth = decoratorWidth + 120;
    final int itemsCount = Mocks.listMenuOption.length;
    final double step = math.pi / itemsCount;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Circular Menu"),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: Column(
          children: <Widget>[
            const ToolBarGroup(),
            MainGroup(
              decoratorWidth: decoratorWidth,
              outDecoratorWidth: outDecoratorWidth,
              itemsCount: itemsCount,
              step: step,
              animatedAngle: _animatedAngle.value,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: const Color(0xfff0f0f0),
            )
          ],
        )),
      ),
    );
  }
}

class MainGroup extends StatelessWidget {
  const MainGroup({
    super.key,
    required this.decoratorWidth,
    required this.outDecoratorWidth,
    required this.itemsCount,
    required this.step,
    required this.animatedAngle,
  });

  final double decoratorWidth;
  final double outDecoratorWidth;
  final int itemsCount;
  final double step;
  final double animatedAngle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          right: -decoratorWidth / 2,
          child: Transform.rotate(
            angle: -animatedAngle,
            child: SvgPicture.asset(
              'assets/images/decoration.svg',
              width: decoratorWidth,
            ),
          ),
        ),
        Positioned(
          right: -outDecoratorWidth / 2,
          child: Transform.rotate(
            angle: -animatedAngle,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: outDecoratorWidth,
                  height: outDecoratorWidth,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.redAccent)),
                ),
                ...List.generate(itemsCount, (index) {
                  final angle = (math.pi / 2 + index * step) + (step / 2);
                  final offset = Offset(outDecoratorWidth / 2 * math.cos(angle),
                      outDecoratorWidth / 2 * math.sin(angle));
                  final textOffset =
                      Offset(-100, 10 - (30 * (index / itemsCount)));
                  final option = Mocks.listMenuOption[index];
                  return MenuItemWidget(
                    offset: offset,
                    textOffset: textOffset,
                    menuOption: option,
                  );
                }).toList()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class ToolBarGroup extends StatelessWidget {
  const ToolBarGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'What does your soul\nneed today?',
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () => print('Profile'),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  shape: BoxShape.circle,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(-10, 10))
                  ],
                  border: Border.all(width: 2, color: Colors.redAccent)),
              child: const Center(
                  child: Icon(
                Icons.person,
                color: Colors.black,
              )),
            ),
          )
        ],
      ),
    );
  }
}
