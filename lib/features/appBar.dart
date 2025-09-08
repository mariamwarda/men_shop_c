
import 'package:flutter/material.dart';
import 'package:menshop/helpers/text_style.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
   appBar({
     super.key,
     this.centered=true,
     required this.title,
     this.button=true
   });
  bool centered;
  final String title;
  bool button;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: Colors.white,
        centerTitle: centered,
        leading: button? BackButton():const SizedBox.shrink(),
        title:Text(title,
          style: AppTextStyles.kHeadTextStyle32,)
    );
  }

   @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
