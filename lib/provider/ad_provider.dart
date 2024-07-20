import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../models/ads.dart';

class AdNotifier extends StateNotifier<AdProvider> {
  AdNotifier() : super(AdProvider());

  void initialiseHomePageBanner() async{
    final banner = BannerAd(
      adUnitId: AdHelper.homepageBanner(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          state = state.copyWith(
            isHomepageBannerLoaded: true,
            homepageBanner: ad as BannerAd,
          );
          log('HomePage Banner Loaded');
        },
        onAdClosed: (ad) {
          state = state.copyWith(isHomepageBannerLoaded: false);
          ad.dispose();
        },
        onAdFailedToLoad: (ad, err) {
          state = state.copyWith(isHomepageBannerLoaded: false);
          log(err.toString());
        },
      ),
    );
    await banner.load();
  }

  void initialiseDetailsPageBanner() async{
    final banner = BannerAd(
      adUnitId: AdHelper.detailsBanner(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          state = state.copyWith(
            isDetailsBannerLoaded: true,
            detailsBanner: ad as BannerAd,
          );
          log('Details Page Banner Loaded');
        },
        onAdClosed: (ad) {
          state = state.copyWith(isDetailsBannerLoaded: false);
          ad.dispose();
        },
        onAdFailedToLoad: (ad, err) {
          state = state.copyWith(isDetailsBannerLoaded: false);
          log(err.toString());
        },
      ),
    );
    await banner.load();
  }

  void initialiseFullPageAd() async{
    await InterstitialAd.load(
      adUnitId: AdHelper.fullPageAd(),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          state = state.copyWith(
            isFullPageAdLoaded: true,
            fullPageAd: ad,
          );
          log('Full Page Ad Loaded');
        },
        onAdFailedToLoad: (err) {
          state = state.copyWith(isFullPageAdLoaded: false);
          log(err.toString());
        },
      ),
    );
  }
}

class AdProvider {
  final bool isHomepageBannerLoaded;
  final BannerAd? homepageBanner;

  final bool isDetailsBannerLoaded;
  final BannerAd? detailsBanner;

  final bool isFullPageAdLoaded;
  final InterstitialAd? fullPageAd;

  AdProvider({
    this.isHomepageBannerLoaded = false,
    this.homepageBanner,
    this.isDetailsBannerLoaded = false,
    this.detailsBanner,
    this.isFullPageAdLoaded = false,
    this.fullPageAd,
  });

  AdProvider copyWith({
    bool? isHomepageBannerLoaded,
    BannerAd? homepageBanner,
    bool? isDetailsBannerLoaded,
    BannerAd? detailsBanner,
    bool? isFullPageAdLoaded,
    InterstitialAd? fullPageAd,
  }) {
    return AdProvider(
      isHomepageBannerLoaded: isHomepageBannerLoaded ?? this.isHomepageBannerLoaded,
      homepageBanner: homepageBanner ?? this.homepageBanner,
      isDetailsBannerLoaded: isDetailsBannerLoaded ?? this.isDetailsBannerLoaded,
      detailsBanner: detailsBanner ?? this.detailsBanner,
      isFullPageAdLoaded: isFullPageAdLoaded ?? this.isFullPageAdLoaded,
      fullPageAd: fullPageAd ?? this.fullPageAd,
    );
  }
}


// Define a provider for the AdNotifier
final adProvider = StateNotifierProvider<AdNotifier, AdProvider>((ref) {
  return AdNotifier();
});
