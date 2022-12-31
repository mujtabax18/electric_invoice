import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';
class CustomInvoiceDropDown extends StatefulWidget {
  const CustomInvoiceDropDown({Key? key,
    required this.cardDropDownImage,
    required this.cardDropDown,
     this.selectedValue=null,
    required this.dropdownChanged
  }) : super(key: key);
  final Function(String?) dropdownChanged;
  final List cardDropDown;
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
          width: 80,
          height: 24,
          child: DropdownButton(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            onChanged: widget.dropdownChanged,
            items: widget.cardDropDown
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: item==widget.cardDropDown.first? const TextStyle(
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
            icon: SizedBox(
              width: 8,
              child: Image.asset(widget.cardDropDownImage, color: kColorBlue),
            ),
            value:widget.selectedValue,
            hint: Text('${widget.cardDropDown.first}  ',
              style: TextStyle(
                  color: kColorDarkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
            underline:SizedBox(),



          ),
        ),
      ],
    );
  }
}
