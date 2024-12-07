import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  const CustomAppBar({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          
          onTap: (() {
            //back
            Navigator.of(context).pop();
          }),
          
          child: Container(
            width: context.propWidth(40),
            height: context.propHeight(40),
            decoration: ShapeDecoration(
              color:  Colors.white,
              shape: CircleBorder(
              
              ),
            ),
           child: Center(child: Image.asset(AssetManger.arrow_left)),
          ),
          
        
        ),
       
      ],
    );
  }
}
