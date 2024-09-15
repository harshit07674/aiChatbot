import 'package:flutter/material.dart';

class RowsWidget extends StatefulWidget {
  String title;
  Icon icon;
   RowsWidget({Key? key,
  required this.title,
    required this.icon
  }) : super(key: key);

  @override
  State<RowsWidget> createState() => _RowsWidgetState();
}

class _RowsWidgetState extends State<RowsWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.2,
      width: size.width*0.45,
      decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
      Colors.amber,
      Colors.amberAccent,
      Colors.amber.shade900,
    ],
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text("${widget.title}",style: TextStyle(color: Colors.black,fontSize: 24),),
          SizedBox(height: 15,),
          widget.icon,
        ],
      ),
    );

  }
}
