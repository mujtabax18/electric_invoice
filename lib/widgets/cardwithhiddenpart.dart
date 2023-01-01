import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';

class CardWithHiddenPart extends StatefulWidget {
  CardWithHiddenPart({
    required this.id,
    required this.no,
    required this.clientName,
    required this.date,
    required this.time,
    required this.total,
    required this.operationType,
    required this.documentType,
    required this.tags,
    required this.hidden,
    required this.showMore,
    required this.downloadDropDownValueSelected,
    required this.downloadDropDownlist,
    required this.downloadDropDownValueChanged,
    required this.convertDropDownValueSelected,
    required this.convertDropDownList,
    required this.convertDropDownValueChanged,
    required this.downloadDropDownitemicon,


    Key? key,
  }) : super(key: key);
  final String id;
  final String no;
  final String clientName;
  final String date;
  final String time;
  final String total;
  final bool hidden;
  final String operationType;
  final String documentType;
  final String tags;
  final VoidCallback showMore;

  final List convertDropDownList;
  final List downloadDropDownlist;
  final String downloadDropDownitemicon;
  final Function(Object?) downloadDropDownValueSelected;
  final Function(Object?) convertDropDownValueSelected;
  final String downloadDropDownValueChanged;
  final String convertDropDownValueChanged;



  @override
  State<CardWithHiddenPart> createState() => _CardWithHiddenPartState();
}

class _CardWithHiddenPartState extends State<CardWithHiddenPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kColorWhite,
      ),
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.id,
                    style: TextStyle(
                      color: kColorBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('RUC: ', style: TextStyle(
                        color: kColorGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(widget.no,  style: TextStyle(
                        color: kColorBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Client FullName', style: TextStyle(
                    color: kColorGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(height: 6,),
                  Text(widget.clientName, style: TextStyle(
                    color: kColorBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 37,
                        width: 62,
                        decoration: BoxDecoration(
                        ),

                        child: CustomDownloadDropDown(widget: widget, ),
                      ),
                      SizedBox(width: 12,),
                      CustomConvertDropDown(widget: widget, ),],),
                  SizedBox(height: 20,),
                  Text(widget.date,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kColorGrey,
                    ),),
                  SizedBox(height: 6,),
                  Text(widget.time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kColorGrey,
                    ),),
                  SizedBox(height: 12,),
                  Text('Total',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kColorGrey,
                    ),),
                  SizedBox(height: 6,),
                  Text('\$ ${widget.total}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kColorBlue,
                    ),),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: widget.showMore,
            child: Container(
              width: double.infinity,
              height: 10,
              child: Image.asset( widget.hidden? 'images/dropdown.png': 'images/dropup.png',
                color:widget.hidden? kColorBlue: kColorGrey,),
            ),
          ),
          SizedBox(height: 20,),
          Visibility(
              visible: !widget.hidden,
              child: Column(
                children: [
                  CardHiidenPart(title: 'Operation Type:',
                      value: widget.operationType),
                  SizedBox(height: 10,),
                  CardHiidenPart(title: 'Document Type:',
                      value: widget.documentType),
                  SizedBox(height: 10,),
                  CardHiidenPart(title: 'Tags:',
                      value: widget.tags),


                ],
              )

          )
        ],
      ),
    );
  }
}

class CustomConvertDropDown extends StatefulWidget {
  const CustomConvertDropDown({
    Key? key,
    required this.widget,

  }) : super(key: key);

  final CardWithHiddenPart widget;

  @override
  State<CustomConvertDropDown> createState() => _CustomConvertDropDownState();
}

class _CustomConvertDropDownState extends State<CustomConvertDropDown> {
  @override
  bool clicked1=false;
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanDown: (details) {
        setState(() {
          clicked1=true;
        });
      },
      child: PopupMenuButton(
        offset: Offset(0,40),
        onCanceled: (){
          setState(() {
            clicked1=false;
          });
        },
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        onSelected: widget.widget.convertDropDownValueSelected,
        itemBuilder: (BuildContext context) {
          return List.generate(widget.widget.convertDropDownList.length, (index) {
            return PopupMenuItem(
              onTap:(){
                setState(() {
                  clicked1=false;
                });
              },
              height: 40,
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 16),
              value: widget.widget.convertDropDownList[index][1],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                ImageIcon(AssetImage(widget.widget.convertDropDownList[index][0])
                    ,color:kColorBlue, size: 15),
                SizedBox(width: 10,),
                Text(widget.widget.convertDropDownList[index][1],style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),),
              ]),
            );
          },);},
        child: Container(
            height: 37,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: kColor9.withAlpha(30)),
              color: !clicked1?Colors.transparent:kColorGrey,
            ),
            child:
            Container(

              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              child: Image.asset( !clicked1?'images/dropdown.png':'images/dropup.png', color:!clicked1? kColorBlue:kColorWhite,),
            )


        ),
      ),
    );
  }
}


class CustomDownloadDropDown extends StatefulWidget {
  const CustomDownloadDropDown({
    Key? key,
    required this.widget,

  }) : super(key: key);

  final CardWithHiddenPart widget;

  @override
  State<CustomDownloadDropDown> createState() => _CustomDownloadDropDownState();
}

class _CustomDownloadDropDownState extends State<CustomDownloadDropDown> {
  @override
  bool clicked=false;
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanDown: (details) {
        setState(() {
          clicked=true;
        });
      },
      child: PopupMenuButton(
        onCanceled: (){
          setState(() {
            clicked=false;
          });
        },
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        onSelected:
        widget.widget.downloadDropDownValueSelected,

        offset: Offset(0, 40),
        itemBuilder: (BuildContext context) {
          return List.generate(widget.widget.downloadDropDownlist.length, (index) {
            return PopupMenuItem(
              onTap:(){
                setState(() {
                  clicked=false;
                });
              },
              height: 40,
              padding: EdgeInsets.only(top: 8, left: 16,bottom: 8),
              value: widget.widget.downloadDropDownlist[index],
              child: Row(children: [
                ImageIcon(AssetImage(widget.widget.downloadDropDownitemicon)
                    ,color:kColorBlue, size: 15),
                SizedBox(width: 10,),
                Text('Download ${widget.widget.downloadDropDownlist[index]}',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),),
              ]),
            );
          },);},
        child: Container(
            height: 37,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),

            ),
            child:
            Container(
              decoration: BoxDecoration(
                color:clicked?kColorGrey:kColorLight,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              child: Row(
                children: [
                  Image.asset('images/savesign.png',color: kColorWhite,),
                  SizedBox(width: 10,),
                  ImageIcon(AssetImage(!clicked?'images/dropdown.png': 'images/dropup.png',)
                    ,color: kColorWhite,
                    size: 10,)
                ],
              ),
            )


        ),
      ),
    );
  }
}


class CardHiidenPart extends StatelessWidget {
  const CardHiidenPart({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 160,
        child: Text(title,style: TextStyle(
          color: kColorGrey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),),
      ),

      Text(value,style: TextStyle(
        color: kColorBlue,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),),
    ],);
  }
}
