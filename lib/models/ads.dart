
import 'dart:io';

class AdHelper{

  static const testBannerAd = "ca-app-pub-3940256099942544/6300978111";
  static const testInterstitialAd = "ca-app-pub-3940256099942544/1033173712";

  static String homepageBanner(){
    if(Platform.isAndroid){
      // return testBannerAd;
      return "ca-app-pub-8340327600860945/7552967942";
    }else{
      return "";
    }
  }

  static String detailsBanner(){
    if(Platform.isAndroid){
      // return testBannerAd;
      return "ca-app-pub-8340327600860945/7500549945";
    }else{
      return "";
    }
  }

  static String fullPageAd(){
    if(Platform.isAndroid){
      // return testInterstitialAd;
      return "ca-app-pub-8340327600860945/6654819249";
    }else{
      return "";
    }
  }



}