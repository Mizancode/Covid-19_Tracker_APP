import 'package:covid_19_tracker/Screens/detailScreen.dart';
import 'package:covid_19_tracker/modelHelper/statsModelHelper.dart';
import 'package:covid_19_tracker/utils/reusableConuntryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../modelHelper/statsCountryHelper.dart';
class CountryWiseTrack extends StatefulWidget{
  @override
  State<CountryWiseTrack> createState() => _CountryWiseTrackState();
}

class _CountryWiseTrackState extends State<CountryWiseTrack> with SingleTickerProviderStateMixin {
  late final AnimationController controller=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  final searchController=TextEditingController();

  StatsCountryHelper statsCountryHelper=StatsCountryHelper();

  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Wise Track'),
      ),
      backgroundColor: Color(0xff414a4c),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height*1,
          width: mediaQuery.size.width*1,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.size.height*0.02,
                  ),
                  TextFormField(
                    onChanged: (value){
                      setState(() {

                      });
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        labelText: 'Search Country Wise',
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black
                            )
                        )
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: statsCountryHelper.getCountryStats(),
                        builder: (context,snapshot){
                        if(snapshot.hasData){
                          return Column(
                            children: [
                              SizedBox(height: mediaQuery.size.height*0.03,),
                              Card(
                                color:Color(0xff414a4c),
                                child: Container(
                                  height:MediaQuery.of(context).size.height*0.83,
                                  child: ListView.builder(
                                    itemCount: statsCountryHelper.countryList.length,
                                      itemBuilder: (context,index){
                                        if(searchController.text.isEmpty){
                                          return GestureDetector(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(statsCountryHelper.countryList[index])));
                                            },
                                              child: ReusableCountryListRow(flagUrl: statsCountryHelper.countryList[index].countryInfo!.flag!.toString(), countryName:statsCountryHelper.countryList[index].country.toString() , cases: double.parse(statsCountryHelper.countryList[index].cases.toString())));
                                        }else if(statsCountryHelper.countryList[index].country!.toLowerCase().contains(searchController.text.toLowerCase())){
                                          return GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(statsCountryHelper.countryList[index])));
                                              },
                                              child: ReusableCountryListRow(flagUrl: statsCountryHelper.countryList[index].countryInfo!.flag!.toString(), countryName:statsCountryHelper.countryList[index].country.toString() , cases: double.parse(statsCountryHelper.countryList[index].cases.toString())));
                                        }else{
                                          return Container();
                                        }
                                      },
                                  ),
                                )
                              )
                            ],
                          );
                        }else{
                          return SpinKitFadingCircle(
                            color: Colors.white,
                            controller: controller,
                            size: 50.0,
                          );
                        }
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}