import '../../provider/ad_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SettingsPageAd extends ConsumerStatefulWidget{
  
  const SettingsPageAd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SettingsPageAd();
  }


}

class _SettingsPageAd extends ConsumerState<SettingsPageAd>{
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adProvider.notifier).initialiseDetailsPageBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final adNotifier = ref.watch(adProvider);

    return Container(
      child: adNotifier.isDetailsBannerLoaded
          ? SizedBox(
              height: adNotifier.detailsBanner!.size.height.toDouble(),
              child: AdWidget(ad: adNotifier.detailsBanner!),
            )
          : const SizedBox.shrink(),
    );

  }
}