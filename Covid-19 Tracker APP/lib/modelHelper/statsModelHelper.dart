import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/StatsModel.dart';
class StatsModelHelper{
  Future<StatsModel> getStats()async{
    final response=await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    var data=jsonDecode(response.body);
    if(response.statusCode==200){
      return StatsModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
}