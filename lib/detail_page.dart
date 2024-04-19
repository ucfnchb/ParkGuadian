import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});


  @override
  State<StatefulWidget> createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Detail', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      body: Column(
        children: [
          _buildLabel('Report Location:'),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('Issue Category:'),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('Issue Description:'),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('Email:'),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: MaterialButton(
                  color: const Color(0xff154406),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                  child: const Text('SAVE', style: TextStyle(color: Colors.white),),
                  onPressed: () {

                  }),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _buildLabel (String title, ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Expanded(child: TextFormField(
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none
            ),

          ),)
        ],
      ),
    );
  }

}