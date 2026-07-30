import 'package:flutter/material.dart';

import '../models/provider_main_page_tabs_enum.dart';

part "provider_main_page_mixin.dart";
part 'provider_main_page_updater.dart';

class ProviderMainPageObserver<ProviderMainPageTabsEnum> {
  final void Function(ProviderMainPageTabsEnum tab)? onTabChanged;

  ProviderMainPageObserver({this.onTabChanged}) {
    ProviderMainPageUpdater.instance.attachObserver(this);
  }

  void dispose() {
    ProviderMainPageUpdater.instance.deAttachObserver(this);
  }

  void notifyOnChangedCallbacks(ProviderMainPageTabsEnum tab) {
    if (onTabChanged != null) {
      onTabChanged!(tab);
    }
  }
}
