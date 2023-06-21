import 'package:flutter/material.dart';
class ReusableCountryListRow extends StatelessWidget{
  final String flagUrl;
  final String countryName;
  final double cases;
  ReusableCountryListRow({required this.flagUrl,required this.countryName,required this.cases});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(flagUrl),
          ),
          title: Text(countryName,style: TextStyle(color: Colors.white,fontSize: 20),),
          subtitle: Text(cases.toString(),style:TextStyle(color: Colors.grey,fontSize: 16),),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
      ],
    );
  }
}