import '../../provider/ad_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ExpensesPageAd extends ConsumerStatefulWidget{
  
  const ExpensesPageAd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ExpensesPageAd();
  }


}

class _ExpensesPageAd extends ConsumerState<ExpensesPageAd>{
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adProvider.notifier).initialiseHomePageBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final adNotifier = ref.watch(adProvider);

    return Container(
      child: adNotifier.isHomepageBannerLoaded
          ? SizedBox(
              height: adNotifier.homepageBanner!.size.height.toDouble(),
              child: AdWidget(ad: adNotifier.homepageBanner!),
            )
          : const SizedBox.shrink(),
    );

  }
}