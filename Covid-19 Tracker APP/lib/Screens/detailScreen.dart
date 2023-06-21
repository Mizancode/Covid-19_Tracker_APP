import 'package:covid_19_tracker/utils/reusableRow.dart';
import 'package:flutter/material.dart';

import '../Model/StatsCountryModel.dart';
class Detail extends StatelessWidget{
  final StatsCountryModel model;
  Detail(this.model);
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xff414a4c),
      appBar: AppBar(
        title: Text(model.country.toString()),
      ),
      body: Container(
        height: mediaQuery.size.height*1,
        width: mediaQuery.size.width*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  color: Color(0xff414a4c),
                  child: Column(
                    children: [
                      ReusableRow(title: 'Total', value: double.parse(model.cases.toString())),
                      ReusableRow(title: 'Recovered', value: double.parse(model.recovered.toString())),
                      ReusableRow(title: 'Dead', value: double.parse(model.deaths.toString())),
                      ReusableRow(title: 'Active', value: double.parse(model.active.toString())),
                      ReusableRow(title: 'Critical', value: double.parse(model.critical.toString())),
                      ReusableRow(title: 'Test', value: double.parse(model.tests.toString())),
                      ReusableRow(title: 'Population', value: double.parse(model.population.toString())),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(model.countryInfo!.flag.toString()),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}