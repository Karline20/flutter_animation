import 'package:animation/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  late AnimationStatus catAnimationStatus;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  onTap() {
    catAnimationStatus.isForwardOrCompleted ? reverse() : forward();
  }

  forward() {
    catController.forward();
  }

  reverse() {
    catController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation',
        ),
      ),
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Stack(
            children: [
              buildCatAnimation(),
              buildBox(), 
              buildLeftFlap(),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: catAnimation.value,
          right: 0.0,
          left: 0.0,
          child: child!,
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap(){
    return Container(
      height: 10.0,
      width: 125.0,
      color: Colors.red,
    );
  }
}
