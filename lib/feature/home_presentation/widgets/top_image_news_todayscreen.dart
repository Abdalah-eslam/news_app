import 'package:flutter/material.dart';

class Topimagenews extends StatefulWidget {
  const Topimagenews({super.key, required this.image});
  final String image;

  @override
  State<Topimagenews> createState() => _TopimagenewsState();
}

class _TopimagenewsState extends State<Topimagenews> {
  bool showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onDoubleTap: () {
          setState(() {
            showOverlay = true;
            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                showOverlay = false;
              });
            });
          });
        },
        enableFeedback: false,
        child: Stack(
          children: [
            Container(
              width: 250,
              height: 200,

              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: showOverlay ? 1 : 0,
              child: Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
