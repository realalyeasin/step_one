import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:step_one/Repositories/repo.dart';
import 'package:step_one/Screens/exercise.dart';
import 'package:step_one/Screens/nutrition.dart';
import 'package:step_one/Screens/quotes.dart';
import '../Bloc/data_bloc.dart';
import '../Bloc/data_event.dart';
import '../Bloc/data_state.dart';
import 'package:step_one/Extension/BuildContext/loc.dart';

import '../Custom/custom_paint1.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Repo repo = Get.put(Repo());
  var icon1 = [
    FontAwesomeIcons.noteSticky,
    FontAwesomeIcons.fileWord,
    FontAwesomeIcons.pencil
  ];
  var icon2 = [
    FontAwesomeIcons.bookAtlas,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.timeline
  ];
  String date = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.extension,
          color: Colors.black,
        ),
        backgroundColor: const Color.fromRGBO(160, 232, 114, 1),
        title: Text(
          context.loc!.appbar_title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
      ),
      backgroundColor: const Color.fromRGBO(160, 220, 187, 1),
      body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
        if (state is DataInitialState) {
          context.read<DataBloc>().add(LoadDataEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DataLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DataLoadedState) {
          return HomeUI(state.api, width, context);
        } else if (state is DataErrorState) {
          return const Text("Something went wrong");
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      }),
    );
  }

  Widget HomeUI(RxList api, double width, BuildContext context) {
    var getTo = [Quotes(), Nutrition(), const Exercise()];
    var name1 = [
      context.loc!.r1n1,
      context.loc!.r1n2,
      context.loc!.r1n3,
    ];
    var name2 = [
      context.loc!.r2n1,
      context.loc!.r2n2,
      context.loc!.r2n3,
    ];
    var name3 = [
      context.loc!.r3n1,
      context.loc!.r3n2,
      context.loc!.r3n3,
    ];
    return Column(
      children: [
        SizedBox(
          height: 170,
          width: width,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, left: 12, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.teal.shade400,
                      child: GestureDetector(
                        onTap: () {
                          print("clicked");
                        },
                        child: GlassmorphicContainer(
                          height: 170,
                          width: width * .6,
                          borderRadius: 20,
                          blur: 70,
                          alignment: Alignment.center,
                          border: 4,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.01),
                                Color(0xFFFFFFFF).withOpacity(0.01),
                              ],
                              stops: [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFffffff).withOpacity(0.5),
                              Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 6),
                                child: Row(
                                  children: [
                                    Icon(
                                      icon1[index],
                                      color: Colors.teal,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(name1[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: .5,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                endIndent: 10,
                                indent: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: 3),
        ),
        const Divider(
          height: 20,
        ),
        SizedBox(
          height: 170,
          width: width,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 12, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.orangeAccent.shade200,
                      child: GestureDetector(
                        onTap: () {
                          print("clicked");
                        },
                        child: GlassmorphicContainer(
                          height: 170,
                          width: width * .6,
                          borderRadius: 20,
                          blur: 70,
                          alignment: Alignment.center,
                          border: 3,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.01),
                                const Color(0xFFFFFFFF).withOpacity(0.01),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.5),
                              const Color((0xFFFFFFFF)).withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 15, bottom: 6),
                                child: Row(
                                  children: [
                                    Icon(
                                      icon2[index],
                                      color: Colors.indigo,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(name2[index],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: .5,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                                endIndent: 10,
                                indent: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: 3),
        ),
        const Divider(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DigitalClock(
                is24HourTimeFormat: false,
                digitAnimationStyle: Curves.easeOutExpo,
                areaWidth: width / 2.25,
                areaHeight: 37,
                areaDecoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 37,
                width: width / 2.25,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  date,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 2,
          indent: 10,
          endIndent: 10,
          height: 3,
        ),
        const Divider(
          thickness: 2,
          indent: 15,
          endIndent: 15,
        ),
        SizedBox(
          width: width,
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.all(9),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => getTo[index]);
                      repo.nutritionModels();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.black,
                        height: 80,
                        width: width - 100,
                        child: Center(
                          child: Text(name3[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Row(
            children: [
              Container(height: 56, width: 110, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Container(height: 56, width: 110, color: Colors.black),
              Container(
                height: 70,
                width: 155,
                child: CustomPaint(painter: RPSCustomPainter()),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 92,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                  border: Border.all(color: Colors.white, width: 3)),
            ),
            const Positioned(
                top: 36,
                left: 110,
                child: Icon(
                  FontAwesomeIcons.newspaper,
                  color: Colors.white,
                )),
            Positioned(
                top: 25,
                left: width / 3,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    context.loc!.bottomTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                )),
          ],
        )
      ],
    );
  }
}
