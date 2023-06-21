import 'package:flutter/material.dart';
class ReusableRow extends StatelessWidget{
  final String title;
  final double value;
  ReusableRow({required this.title,required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(fontSize: 20,color: Colors.white),),
              Text(value.toString(),style: TextStyle(fontSize: 20,color: Colors.white),)
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
        ],
      ),
    );
  }
}