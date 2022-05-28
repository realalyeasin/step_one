import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_one/Repositories/repo.dart';

class Quotes extends StatelessWidget {
  Quotes({Key? key}) : super(key: key);
  TextEditingController textEditingControllerQuotCat = TextEditingController();
  Repo repo = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("Quotes of the Day",style: TextStyle(fontStyle: FontStyle.italic),),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.teal.shade200,
                              ),
                              child: TextFormField(
                                controller: textEditingControllerQuotCat,
                                onChanged: (value){
                                  repo.getQuotes(value);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    suffixIcon: IconButton(onPressed: () {
                                      repo.getQuotes(textEditingControllerQuotCat.text);
                                       }, icon: Icon(Icons.search,color: Colors.black,),),
                                    hintText: 'Type your type of quotes i.e Morning',
                                    filled: true,
                                    fillColor: Colors.teal.shade200,focusColor: Colors.white,hoverColor: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: IconButton(onPressed: (){
                                textEditingControllerQuotCat.clear();
                                repo.quoteModels.value = [];
                              }, icon: Icon(Icons.clear,color: Colors.pink,)),
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.separated(
                      itemCount: repo.quoteModels.length,
                      itemBuilder: (BuildContext, index){
                        return Column(
                          children: [
                            Text(repo.quoteModels[index].quote,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 17)),
                            Text("--""${repo.quoteModels[index].author}",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 15)),
                            SizedBox(height: 20,)
                          ],
                        );
                      }, separatorBuilder: (BuildContext, index) {
                      print("hereee");
                      return Divider(thickness: 2,height: 30,color: Colors.white,);
                    },),
                  ),
                  SizedBox(height: 10,)
                ],
              )
          ),
        )
    ));
  }
}
