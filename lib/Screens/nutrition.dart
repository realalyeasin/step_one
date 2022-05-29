import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Repositories/repo.dart';

class Nutrition extends StatelessWidget {
  Nutrition({Key? key}) : super(key: key);
  Repo repo = Get.find();
  TextEditingController textEditingControllerNut = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Nutrition",style: TextStyle(fontStyle: FontStyle.italic, letterSpacing: 2)),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/nutrition.jpg",
                      ),
                      filterQuality: FilterQuality.medium,
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                      fit: BoxFit.scaleDown)),
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: TextFormField(
                                  controller: textEditingControllerNut,
                                  onChanged: (value) {
                                    repo.getNutrition(value);
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          repo.getQuotes(
                                              textEditingControllerNut.text);
                                        },
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                      ),
                                      hintText:
                                          'Get your nutrition here . . . ',
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      textEditingControllerNut.clear();
                                      repo.repoNutApi.clear();
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.pink,
                                    )),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                          itemCount: repo.nutritionModels.length,
                          itemBuilder: (BuildContext, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 40,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Name : "
                                        '${repo.nutritionModels[index].name}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Calories : "
                                        '${repo.nutritionModels[index].calories}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Serving Size G : "
                                        '${repo.nutritionModels[index].servingSizeG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Fat Total G : "
                                        '${repo.nutritionModels[index].fatTotalG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Fat Saturated G : "
                                        '${repo.nutritionModels[index].fatSaturatedG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Protein G : "
                                        '${repo.nutritionModels[index].proteinG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Sodium MG : "
                                        '${repo.nutritionModels[index].sodiumMg}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Potassium MG : "
                                        '${repo.nutritionModels[index].potassiumMg}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cholesterol MG : "
                                        '${repo.nutritionModels[index].cholesterolMg}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Carbohydrates Total G : "
                                        '${repo.nutritionModels[index].carbohydratesTotalG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Fiber G : "
                                        '${repo.nutritionModels[index].fiberG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 30,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Fiber G : "
                                        '${repo.nutritionModels[index].sugarG}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext, index) {
                            return SizedBox(
                              height: 10,
                            );
                          }),
                    )
                  ]))),
        ))));
  }
}
