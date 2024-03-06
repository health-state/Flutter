import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_state/presention/resources/Constant.dart';
import 'package:health_state/presention/resources/assets_Manager.dart';
import 'package:health_state/presention/resources/color_manager.dart';
import 'package:health_state/presention/resources/routes_Manager.dart';
import 'package:health_state/presention/resources/strings_Manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/values_manager.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var _pageSliderController =PageController();
  late final List<sliderObject> _list = _getSliderData();
  int _currentIndex=0;
  List<sliderObject> _getSliderData() => [
        sliderObject(ImagesAssets.onboarding_logo1,
            AppStrings.onBoardingSubTitle1, AppStrings.onBoardingSubTitle1),
        sliderObject(ImagesAssets.onboarding_logo2,
            AppStrings.onBoardingSubTitle2, AppStrings.onBoardingSubTitle2),
        sliderObject(ImagesAssets.onboarding_logo3,
            AppStrings.onBoardingSubTitle3, AppStrings.onBoardingSubTitle3),
    sliderObject(ImagesAssets.onboarding_logo4,
            AppStrings.onBoardingSubTitle4, AppStrings.onBoardingSubTitle4),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
            statusBarColor: ColorManager.white),
        elevation: 0.00,
      ),
      body: PageView.builder(itemBuilder: (context,index)=>ItemBuilder(_list[index]),itemCount: _list.length,onPageChanged: (value) {
        setState(() {
          _currentIndex=value;
        });
      },controller:_pageSliderController ),
      bottomSheet: Container(
        height: AppSize.s100,
      color: ColorManager.white,
        child:Column(children: [
          Align(
            alignment: Alignment.center,
            child: TextButton(child:Text(AppStrings.skip,style: TextStyle(color: ColorManager.primary),),onPressed:(){} ,),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                if(_list.length>3){
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }else{
                  _pageSliderController.nextPage(duration:const Duration(milliseconds: AppConstants.sliderPage),curve: Curves.easeInOutCubicEmphasized);
                }
              }, icon: Icon(Icons.arrow_back_ios)),
              SmoothPageIndicator(controller:_pageSliderController , count:_list.length,effect:WormEffect(dotWidth: .5,dotHeight: .2), ),
              IconButton(onPressed: (){
                if(_list.length>3){
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              }else{
                _pageSliderController.previousPage(duration:const Duration(milliseconds:AppConstants.sliderPage),curve: Curves.easeInOutCubicEmphasized);
              }
              }, icon: Icon(Icons.arrow_forward_ios)),

              ],)
        ],) ,),
    );
  }
}

class sliderObject {
  String title;
  String subTitle;
  String image;
  sliderObject(this.image, this.title, this.subTitle);
}
  class ItemBuilder extends StatelessWidget {
   final  sliderObject _sliderObject;
    const ItemBuilder(this._sliderObject,{super.key});

    @override
    Widget build(BuildContext context) {
      return Column(children: [
    Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Text(_sliderObject.title,style: Theme.of(context).textTheme.displayLarge,),
    ),
    const SizedBox(height:AppSize.s20,),
    Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Text(_sliderObject.subTitle,),
    ),
    const SizedBox(height: AppSize.s50,),
    SvgPicture.asset(_sliderObject.image),

  ],);
    }
  }

