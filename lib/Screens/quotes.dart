import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_one/Repositories/repo.dart';

class Quotes extends StatelessWidget {
  Quotes({Key? key, required this.api}) : super(key: key);
  TextEditingController textEditingControllerQuotCat = TextEditingController();
  final api;
  Repo repo = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(
            "Quotes of the Day",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      color: Colors.teal.shade200,
                      child: TextFormField(
                        controller: textEditingControllerQuotCat,
                        onChanged: (value) {
                          repo.getQuotes(value);
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                repo.getQuotes(
                                    textEditingControllerQuotCat.text);
                                print(api.elementAt(1).quote);
                              },
                              icon: Icon(Icons.search),
                            ),
                            hintText: 'Type your type of quotes i.e Morning',
                            filled: true,
                            fillColor: Colors.teal.shade200,
                            focusColor: Colors.white,
                            hoverColor: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 500,
                      child: Obx(
                        () => ListView.separated(
                          itemCount: api.length,
                          itemBuilder: (BuildContext, index) {
                            return Column(
                              children: [
                                Text(api[index].quote,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 17)),
                                Text("--" "${api[index].author}",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext, index) {
                            print("hereee");
                            print(api);
                            return Divider(
                              thickness: 2,
                              height: 30,
                              color: Colors.white,
                            );
                          },
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  )
                ],
              )),
        ));
  }
}
