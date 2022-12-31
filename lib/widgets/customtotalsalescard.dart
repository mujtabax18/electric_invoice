

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
     DropdownButton(
       borderRadius: BorderRadius.all(Radius.circular(8)),
         onChanged: widget.dropdownChanged,
     items: widget.cardDropDown
         .map((item) =>
         DropdownMenuItem<String>(

           value: item,
           child: Text(
             item,
             style: item==widget.cardDropDown.last? const TextStyle(
               fontSize: 12,
               color: kColorBlue,
               fontWeight: FontWeight.w600,
             ): item==widget.cardDropDown.first? const TextStyle(
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
        icon: SizedBox(
          width: 8,
          child: Image.asset(widget.cardDropDownImage),
        ),
       value:widget.selectedValue,
       hint: Text('${widget.cardDropDown.first}  ',
         style: TextStyle(
           color: kColorWhite,
           fontWeight: FontWeight.w600,
           fontSize: 12
         ),
       ),
       underline:SizedBox(),
       isExpanded:false,


     )

        ],
      ),
    );
  }
}
