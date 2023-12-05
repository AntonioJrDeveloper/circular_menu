import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final decoratorWidth = size.width * 0.8;
    final outDecoratorWidth = decoratorWidth + 120;

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
                outDecoratorWidth: outDecoratorWidth),
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
  });

  final double decoratorWidth;
  final double outDecoratorWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          right: -decoratorWidth / 2,
          child: SvgPicture.asset(
            'assets/images/decoration.svg',
            width: decoratorWidth,
          ),
        ),
        Positioned(
          right: -outDecoratorWidth / 2,
          child: Container(
            width: outDecoratorWidth,
            height: outDecoratorWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.redAccent)),
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
