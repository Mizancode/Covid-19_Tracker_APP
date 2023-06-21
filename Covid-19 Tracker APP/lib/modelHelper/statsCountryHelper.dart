import 'dart:convert';

import 'package:covid_19_tracker/Model/StatsCountryModel.dart';
import 'package:http/http.dart' as http;

class StatsCountryHelper{
  List<StatsCountryModel> countryList=[];
  Future<List<StatsCountryModel>> getCountryStats()async{
    final response=await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    var data=jsonDecode(response.body);
    if(response.statusCode==200){
      for(Map i in data){
        countryList.add(StatsCountryModel.fromJson(i));
      }
      return countryList;
    }else{
      throw Exception('Error');
    }
  }
}