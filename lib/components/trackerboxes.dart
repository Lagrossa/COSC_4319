import 'package:flutter/material.dart';
import 'themeColors.dart';

class TrackerBox extends StatelessWidget {
  final String path;
  final String name;
  
  const TrackerBox({
    super.key,
    required this.path,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(children: [
                  Container(
                      height: 200,
                      color: const Color(0xFF111417),
                      alignment: const Alignment(0, 0),
                      child: Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF111417)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: const Color(0xFF111417))))),
                          child: FittedBox(
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: ThemeColors.white,
                                  fontSize: 35,
                                  fontFamily: 'Roboto'),                                  
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, path);
                          },
                        ),
                      )),
                ]),
              ),
            ),
          );
  }
}