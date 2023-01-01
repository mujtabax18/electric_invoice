

import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomTotalSalesCard extends StatefulWidget {
  const CustomTotalSalesCard({
    required this.cardImage ,
    required this.totalSales,
    required this.cardDropDown,
    required this.dropdownChanged,
    required this.cardDropDownImage,
     this.selectedValue=null,
    Key? key}) : super(key: key);
  final String cardImage;
  final String totalSales;
  final List<String> cardDropDown;
  final Function(String?) dropdownChanged;
  final String? selectedValue;
  final String cardDropDownImage;

  @override
  State<CustomTotalSalesCard> createState() => _CustomTotalSalesCardState();
}

class _CustomTotalSalesCardState extends State<CustomTotalSalesCard> {


 @override
  void initState() {

   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
         color: kColorBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                 radius: 16,
                  child: SizedBox(
                      width: 22.59,
                      child: Image.asset(widget.cardImage)),
              ),
              SizedBox(width: 12,),
              Column(children: [
                Text('\$${widget.totalSales}',
                style: TextStyle(
                  color: kColorWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                )),
                SizedBox(height: 6,),
                Text('Total Sales',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kColorWhite,
                ),),
              ],),
            ],
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              selectedItemBuilder: (BuildContext context) {
                return widget.cardDropDown.map((item) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(item, style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kColorWhite,
                    ),),
                  );
                }).toList();
              },
              hint: Text(
                widget.cardDropDown.first,
                style: TextStyle(
                  fontSize: 12,
                  color:kColorWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              items: widget.cardDropDown
                  .map((item) =>
                  DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    value: item,
                    enabled: item==widget.selectedValue? false:true,
                    child: Text(
                      item,
                      style: item==widget.cardDropDown.last? const TextStyle(
                        fontSize: 12,
                        color: kColorBlue,
                        fontWeight: FontWeight.w600,
                      ): item==widget.selectedValue? const TextStyle(
                        fontSize: 12,
                        color: kColorGrey,
                        fontWeight: FontWeight.w600,
                      ):const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )
                      ,
                    ),
                  ))
                  .toList(),
              iconSize: 10,
              iconEnabledColor: kColorWhite,
              iconOnClick: ImageIcon(AssetImage('images/dropup.png')),
              icon: ImageIcon(AssetImage('images/dropdown.png')),
              value: widget.selectedValue,
              onChanged: widget.dropdownChanged,
              buttonHeight: 40,
              buttonWidth: 100,
              itemHeight: 40,
            ),
          ),


        ],
      ),
    );
  }
}



