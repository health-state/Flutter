import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_state/presention/resources/color_manager.dart';
import 'package:health_state/presention/resources/fonts_manager.dart';
import 'package:health_state/presention/resources/routes_Manager.dart';
import 'package:health_state/presention/resources/strings_Manager.dart';

import '../resources/assets_Manager.dart';
import '../resources/values_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
        body: Padding(
    padding: EdgeInsets.all(AppSize.s20),
    child: Center(
    child: Column(
    children: [
    SizedBox(
    height: AppSize.s50,
    ),
    Image(image: AssetImage(ImagesAssets.Logo)),
    SizedBox(
    height: AppSize.s60,
    ),
      TextFormField( validator:(val){},decoration:InputDecoration(hintText: 'E_mail',label:Text('E_mail') ,border: OutlineInputBorder(borderRadius:BorderRadius.circular(30))),),
    ],
    ),
    ),
    ),
    );
  }
}
