part of 'provider_main_page_observer.dart';

mixin ProviderMainPageObserverMixin<T extends StatefulWidget> on State<T> {
  ProviderMainPageObserver? mainPageObserver;

  void initObserver<E extends ProviderMainPageTabsEnum, K>({void Function(ProviderMainPageTabsEnum tab)? onTabChanged}) {
    mainPageObserver = ProviderMainPageObserver<ProviderMainPageTabsEnum>(onTabChanged: onTabChanged);
  }

  @override
  void dispose() {
    mainPageObserver?.dispose();
    super.dispose();
  }
}
