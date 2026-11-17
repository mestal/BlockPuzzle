import 'dart:async';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// All ads go through this interface. `AdMobAdService` will replace
/// [DummyAdService] later without touching game code.
abstract interface class AdService {
  /// Full-screen ad between levels.
  Future<void> showInterstitial(BuildContext context);

  /// Rewarded ad. Returns true when the reward should be granted.
  Future<bool> showRewarded(BuildContext context);
}

final adServiceProvider = Provider<AdService>((ref) => const DummyAdService());

/// Placeholder ad: full-screen page with a countdown.
class DummyAdService implements AdService {
  const DummyAdService({this.duration = const Duration(seconds: 3)});

  final Duration duration;

  @override
  Future<void> showInterstitial(BuildContext context) => _show(context);

  @override
  Future<bool> showRewarded(BuildContext context) => _show(context);

  Future<bool> _show(BuildContext context) async {
    final watched = await Navigator.of(context, rootNavigator: true).push<bool>(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => _DummyAdPage(duration: duration),
        transitionsBuilder: (_, animation, _, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
    return watched ?? false;
  }
}

class _DummyAdPage extends StatefulWidget {
  const _DummyAdPage({required this.duration});

  final Duration duration;

  @override
  State<_DummyAdPage> createState() => _DummyAdPageState();
}

class _DummyAdPageState extends State<_DummyAdPage> {
  late int _left = widget.duration.inSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() => _left--);
      if (_left <= 0) t.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final done = _left <= 0;
    return PopScope(
      canPop: done,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.campaign_rounded,
                      size: 72,
                      color: AppColors.gold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.adLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.adPlaceholder,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: done
                    ? FilledButton.tonalIcon(
                        onPressed: () => Navigator.of(context).pop(true),
                        icon: const Icon(Icons.close_rounded),
                        label: Text(l10n.adClose),
                      )
                    : Chip(label: Text(l10n.adCountdown(_left))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
