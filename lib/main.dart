import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'card_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataList = [
    "The interaction with the sales staff ",
    "The organization of the store ",
    "The price of the products ",
    "The sizes available at the store",
    ];

  int groupValue = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Center(
            child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: buildLinearProgressBar(context, index),
                      ),
                      Expanded(
                        flex: 5,
                        child: buildQuestion(index, context),
                      ),
                      Expanded(
                        flex: 10,
                        child: buildOptions(),
                      ),
                      Expanded(
                        flex: 2,
                        child: buildButtons(context, index, dataList.length),
                      ),
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child:
                                  Text("${index + 1} / ${dataList.length}"))),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Padding buildLinearProgressBar(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: LinearProgressIndicator(
          backgroundColor: Colors.white12,
          color: Colors.purple,
          value: (index + 1) / dataList.length,
        ),
      ),
    );
  }

  SizedBox buildQuestion(int index, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
          child: Text(
        "${index + 1}. ${dataList[index]}",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
      )),
    );
  }

  Column buildOptions() {
    return Column(
      children: [
        buildRadioListTile(1, "Very Satisfied"),
        buildRadioListTile(2, "Satisfied"),
        buildRadioListTile(3, "Dissatisfied"),
        buildRadioListTile(4, "Dissatisfied"),
      ],
    );
  }

  SizedBox buildButtons(BuildContext context, int index, int dataListLenght) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: double.infinity,
              child: ButtonWidget(
                bgColor: Colors.white,
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.easeInOut);
                  groupValue = 0;
                },
                widgetBack: const Icon(Icons.arrow_back, color: Colors.purple),
                widgetRight: Text(
                  "Back",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.purple),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: double.infinity,
              child: ButtonWidget(
                  bgColor: Colors.purple,
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.easeInOut);
                  },
                  widgetBack: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white)),
                  widgetRight: const Icon(Icons.arrow_forward, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  CardWidget buildRadioListTile(int valueInt, String text) {
    return CardWidget(
      bgColor: groupValue == valueInt ? Colors.white30 : Colors.white60,
      child: RadioListTile(
          title: Text(text,
              style: Theme.of(context).textTheme.titleLarge!.copyWith()),
          value: valueInt,
          groupValue: groupValue,
          onChanged: (int? value) {
            setState(() {
              groupValue = value!;
            });
          }),
    );
  }
}
