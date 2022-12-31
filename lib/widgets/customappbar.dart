import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.mediaQuery,
    required this.name,
    required this.no,
    required this.NotificationImage,
    required this.acountImage,
    required this.acountImagePress,
    Key? key}) : super(key: key);
    final Size mediaQuery;
    final String name;
    final String no;
    final String NotificationImage;
    final String acountImage;
    final VoidCallback acountImagePress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NameAndNo(name: name, no: no),
        NotificationAndAccount(NotificationImage: NotificationImage,
            acountImagePress: acountImagePress, acountImage: acountImage),
      ],
    );
  }
}

class NotificationAndAccount extends StatelessWidget {
  const NotificationAndAccount({
    Key? key,
    required this.NotificationImage,
    required this.acountImagePress,
    required this.acountImage,
  }) : super(key: key);

  final String NotificationImage;
  final VoidCallback acountImagePress;
  final String acountImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(NotificationImage),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: acountImagePress,
            child: CircleAvatar(child:
            Image.asset(acountImage, fit: BoxFit.fill,)),
          ),

        ],
      ),
    );
  }
}

class NameAndNo extends StatelessWidget {
  const NameAndNo({
    required this.name,
    required this.no,
    Key? key,
  }) : super(key: key);
  final String name;
  final String no;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi, $name', style: TextStyle(
          color: kColorBlue,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        )),
        Text('R.U.C: $no',style: TextStyle(
        color: kColorGrey,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        )),
      ],
    );
  }
}
