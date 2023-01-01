import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class CustomInvoiceDropDown extends StatefulWidget {
  const CustomInvoiceDropDown({Key? key,
    required this.cardDropDownImage,
    required this.cardDropDown,
     this.selectedValue=null,
    required this.dropdownChanged
  }) : super(key: key);
  final Function(String?) dropdownChanged;
  final List<String> cardDropDown;
  final String cardDropDownImage;
  final String? selectedValue;
  @override
  State<CustomInvoiceDropDown> createState() => _CustomInvoiceDropDownState();
}

class _CustomInvoiceDropDownState extends State<CustomInvoiceDropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 130,
          height: 24,
          child:  DropdownButtonHideUnderline(
            child: DropdownButton2(
              selectedItemBuilder: (BuildContext context) {
                return widget.cardDropDown.map((item) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(item, style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kColorDarkBlue,
                    ),),
                  );
                }).toList();
              },
              hint: Text(
                widget.cardDropDown.first,
                style: TextStyle(
                  fontSize: 16,
                  color:kColorDarkBlue,
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
                      style: item==widget.selectedValue? const TextStyle(
                        fontSize: 12,
                        color: kColorBlue,
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
              iconEnabledColor: kColorBlue,
              iconOnClick: ImageIcon(AssetImage('images/dropup.png')),
              icon: ImageIcon(AssetImage('images/dropdown.png')),
              value: widget.selectedValue,
              onChanged: widget.dropdownChanged,
              buttonHeight: 40,
              buttonWidth: 130,
              itemHeight: 30,
            ),
          ),
        ),
      ],
    );
  }
}
