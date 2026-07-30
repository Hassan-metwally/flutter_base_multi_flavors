part of 'provider_main_page_observer.dart';

class ProviderMainPageUpdater {
  ProviderMainPageUpdater._();

  static ProviderMainPageUpdater? _instance;

  static ProviderMainPageUpdater get instance {
    _instance ??= ProviderMainPageUpdater._();
    return _instance!;
  }

  final List<ProviderMainPageObserver> _observers = [];

  void attachObserver<T>(ProviderMainPageObserver observer) {
    _observers.add(observer);
  }

  void deAttachObserver(ProviderMainPageObserver observer) {
    _observers.remove(observer);
  }

  static void notifyOnChangedCallbacks(ProviderMainPageTabsEnum value) {
    for (var observer in instance._observers) {
      observer.notifyOnChangedCallbacks(value);
    }
  }

  static void dispose() {
    _instance?._observers.clear();
    _instance = null;
  }
}
