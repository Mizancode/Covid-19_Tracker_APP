import 'package:covid_19_tracker/Screens/countryWiseTrackScreen.dart';
import 'package:covid_19_tracker/modelHelper/statsModelHelper.dart';
import 'package:covid_19_tracker/utils/reusableRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
class StatsScreen extends StatefulWidget{
  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> with TickerProviderStateMixin {
  late final AnimationController controller=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  StatsModelHelper statsModelHelper=StatsModelHelper();

  @override
  Widget build(BuildContext context) {
    final ColorList=[
      Color(0xff0066FF),
      Color(0xff06ff06),
      Color(0xffff8c00),
    ];
    final mediaQuery=MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xff414a4c),
      body: Container(
        width: mediaQuery.size.width*1,
        height: mediaQuery.size.height*1,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: statsModelHelper.getStats(),
                    builder: (context,snapshot){
                     if(snapshot.hasData){
                       return Column(
                         children: [
                           SizedBox(
                             height: mediaQuery.size.height*0.02,
                           ),
                           PieChart(dataMap:{
                             'Total':double.parse(snapshot.data!.cases.toString()),
                             'Recovered':double.parse(snapshot.data!.recovered.toString()),
                             'Dead':double.parse(snapshot.data!.deaths.toString()),
                           },
                             colorList: ColorList,
                             chartType: ChartType.ring,
                             chartRadius: 150,
                             chartValuesOptions: ChartValuesOptions(
                                 showChartValuesInPercentage: true
                             ),
                             legendOptions: LegendOptions(
                                 legendPosition: LegendPosition.left
                             ),
                           ),
                           SizedBox(
                             height: mediaQuery.size.height*0.04,
                           ),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Card(
                               color: Color(0xff414a4c),
                               child: Column(
                                 children: [
                                   ReusableRow(title: 'Total', value: double.parse(snapshot.data!.cases.toString())),
                                   ReusableRow(title: 'Recovered', value: double.parse(snapshot.data!.recovered.toString())),
                                   ReusableRow(title: 'Dead', value: double.parse(snapshot.data!.deaths.toString())),
                                   ReusableRow(title: 'Active', value: double.parse(snapshot.data!.active.toString())),
                                   ReusableRow(title: 'Critical', value: double.parse(snapshot.data!.critical.toString())),
                                   ReusableRow(title: 'Test', value: double.parse(snapshot.data!.tests.toString())),
                                   ReusableRow(title: 'Population', value: double.parse(snapshot.data!.population.toString())),
                                   ReusableRow(title: 'AffectedCountries', value: double.parse(snapshot.data!.affectedCountries.toString())),
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(height: mediaQuery.size.height*0.01,),
                           Padding(
                             padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                             child: GestureDetector(
                               onTap:(){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryWiseTrack()));
                               },
                               child: Container(
                                 alignment: Alignment.center,
                                 width: mediaQuery.size.width*1,
                                 height: mediaQuery.size.height*0.06,
                                 decoration: BoxDecoration(
                                     border: Border.all(
                                         width: 2,
                                         color: Colors.black
                                     ),
                                     borderRadius: BorderRadius.circular(10.0),
                                     color: Colors.green
                                 ),
                                 child: Text('Track Country Wise',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                               ),
                             ),
                           )
                         ],
                       );
                     }else{
                       return SpinKitFadingCircle(
                         color: Colors.white,
                         controller: controller,
                         size: 50.0,
                         duration: Duration(microseconds: 1200),
                       );
                     }
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}