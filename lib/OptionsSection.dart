import 'package:ecampus/pages/transfert.dart';
import 'package:flutter/material.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 110),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            color: color3,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: color2, // <-- Button color
                        onPrimary: color3, // <-- Splash color
                      ),
                      child:
                          const Icon(Icons.house_outlined, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: color2, // <-- Button color
                        onPrimary: color3, // <-- Splash color
                      ),
                      child: const Icon(Icons.coffee, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: color2, // <-- Button color
                        onPrimary: color3, // <-- Splash color
                      ),
                      child: const Icon(Icons.sports_handball_outlined,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        primary: color2,
                        onPrimary: color3,
                      ),
                      child:
                          const Icon(Icons.info_outline, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
