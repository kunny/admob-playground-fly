import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AnchoredAdaptiveBannerAdWidget extends StatefulWidget {
  final String adUnitId;

  final AdRequest adRequest;

  final double width;

  const AnchoredAdaptiveBannerAdWidget({
    required this.adUnitId,
    required this.adRequest,
    required this.width,
    super.key,
  });

  @override
  State createState() => _AnchoredAdaptiveBannerAdWidgetState();
}

class _AnchoredAdaptiveBannerAdWidgetState
    extends State<AnchoredAdaptiveBannerAdWidget> {
  BannerAd? _ad;

  var _height = 0.0;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    if (_ad == null || _height == 0.0) {
      return const SizedBox();
    }
    return SizedBox(
      width: widget.width,
      height: _height,
      child: AdWidget(
        ad: _ad!,
      ),
    );
  }

  void _loadAd() async {
    final adSize =
        (await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            widget.width.truncate()));
    if (adSize == null) {
      debugPrint('Failed to get the ad size');
      return;
    }

    BannerAd(
      adUnitId: widget.adUnitId,
      request: widget.adRequest,
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }

          setState(() {
            _ad = ad as BannerAd;
            _height = adSize.height.toDouble();
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('Failed to load the ad: ${error.message}');
        },
        onAdImpression: (ad) {
          debugPrint('Displayed banner ad');
        },
      ),
    ).load();
  }
}
