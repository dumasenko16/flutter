import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_flutter/constants.dart';
//import "package:http/http.dart" as http;
import 'package:weather_app_flutter/model/DayModel.dart';
import 'package:weather_app_flutter/model/ApiService.dart';


late List<Day>? _dayModel = [];



void main() {

  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
   
}

class _HomeState extends State<Home> {

  late List<Day>? _dayModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }


  void _getData() async {
    _dayModel = (await ApiService().getTemperature())!;
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: Text("Прогноз погоды", style: kLabelTextStyle),
          ),

          body: Column(
              children: <Widget>[
                Row(children: <Widget>[

                  ElevatedButton(
                    child: const Text('Настройки', style: kLabelTextStyle),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.fromLTRB(150, 5, 0, 0),
                    child: ElevatedButton(
                      child: const Text('Контакты', style: kLabelTextStyle),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThirdRoute()),
                        );
                      },
                    ),
                  ),

                ]),


                Expanded(child: Row(

                    children: const <Widget>[
                      Expanded(child: Text( 'С Наступающим Новым Годом!', style: kLabelTextStyle)
                      )
                    ])),

                Image.asset('assets/images/snow.png', width: 150, height: 150),
                Text("На неделю", style: kLabelTextStyle),
                Expanded(
                  child: Row(
                      children: <Widget>[
                        Expanded(child: DayContainer(
                            temperature: -2, day: 'Понедельник')),
                        Expanded(child: DayContainer(
                            temperature: -7, day: 'Вторник')),
                        Expanded(
                            child: DayContainer(temperature: -3, day: 'Среда')),
                        Expanded(child: DayContainer(
                            temperature: 1, day: 'Четверг')),
                        Expanded(child: DayContainer(
                            temperature: 1, day: 'Пятница')),
                        Expanded(child: DayContainer(
                            temperature: -1, day: 'Суббота')),
                        Expanded(child: DayContainer(
                            temperature: -1, day: 'Воскресенье'))
                      ]

                  ),
                ),
                Text("На день", style: kLabelTextStyle),
                Expanded(
                  child: Row(
                      children: <Widget>[
                        Expanded(child: DayContainer(
                            temperature: -1, day: 'День')),
                        Expanded(child: DayContainer(
                            temperature: -7, day: 'Ночь'))
                      ]

                  ),
                ),
              ]));
    }
  }






class DayContainer extends StatelessWidget {
  final int temperature;
  final String day;
  //final Widget child;

  const DayContainer({
    Key? key,
  required this.temperature,
  required this.day,
  //required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5) ,
        decoration: BoxDecoration(
          color: kInactiveCardColour,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: <Widget> [
          RotatedBox(
              quarterTurns: 1,
              child:
              Text("${day}", style: kLabelTextStyle),
              ),

          Text("${temperature} °C", style: kLabelTextStyle)
        ],
      ),),


    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки', style: kLabelTextStyle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Домой', style: kLabelTextStyle),
        ),
      ),
    );
  }
}
class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты', style: kLabelTextStyle),
      ),

      body: Center(

        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Домой', style: kLabelTextStyle),
        ),

      ),

    );
  }
}




