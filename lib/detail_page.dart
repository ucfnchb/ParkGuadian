import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart'; // local storage
import 'package:park/hive_ext.dart';
import 'package:park/reports_page.dart'; // reports page import which list all the reports

class DetailPage extends StatefulWidget {
  final LatLng currentPosition; // location to reporting
  const DetailPage({super.key, required this.currentPosition});
  @override
  State<StatefulWidget> createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage> {
  // A variable that holds the currently selected issue category.
  String _selectedValue = 'Please choose';
  // A list of issue categories that the user can report.
  // list of issue categories
  final List<String> _options = ['Please choose','Abandoned Bike', 'Bird Mess', 'Dead Animal', 'Dog Bin is full', 'Fly-tipping', 'Footway Defects',
  'Overhanging foliage', 'Blocked Street', 'Prothole', 'Street Lighting', 'Obstruction on the router', 'Rubbish'];

  // text input for issue description and email
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            // A clickable icon that allows the user to navigate back to the previous screen.
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Detail', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      // page layout
      body: Column(
        children: [
          _buildLabel('Report Location:', 'latitude:${widget.currentPosition.latitude}, longitude:${widget.currentPosition.longitude}', null),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildDropdownButton('Issue Category:'),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('Issue Description:', null, _descController),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('Email:', null, _emailController),
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
                  onPressed: () async {
                    if (_selectedValue == _options[0] || _descController.text.isEmpty || _emailController.text.isEmpty) {
                      _showSnackBar(context, 'Please select the fill up all columns！');
                    } else {
                      // if validation pass
                      Map<String, dynamic> data = {
                        'latitude': widget.currentPosition.latitude,
                        'longitude': widget.currentPosition.longitude,
                        'category': _selectedValue,
                        'desc': _descController.text,
                        'email': _emailController.text,
                      };
                      await Hive.putData(data);
                      _showSnackBar(context, 'Save Success！');// data saved into hive local storage
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => ReportsPage()));
                      // navigate to reports page
                      // Navigator.pop(context);

                    }
                  }),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _buildLabel (String title, String? content, TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Expanded(child: content == null? TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none
            ),

          ): Text(content, style: const TextStyle(fontSize: 14, color: Colors.black),),)
        ],
      ),
    );
  }

  Widget _buildDropdownButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Expanded(child: DropdownButton<String>(
            value: _selectedValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
            items: _options
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: '',
        onPressed: () {
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}