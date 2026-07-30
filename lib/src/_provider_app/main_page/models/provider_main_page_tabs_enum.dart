import '../../../../../core/core.dart';

enum ProviderMainPageTabsEnum {
  home,
  providerManagement,
  myOrders,
  more;

  String get filledIc {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return "";
      case ProviderMainPageTabsEnum.providerManagement:
        return "";
      case ProviderMainPageTabsEnum.myOrders:
        return "";
      case ProviderMainPageTabsEnum.more:
        return "";
    }
  }

  String get outlineIc {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return "";
      case ProviderMainPageTabsEnum.providerManagement:
        return "";
      case ProviderMainPageTabsEnum.myOrders:
        return "";
      case ProviderMainPageTabsEnum.more:
        return "";
    }
  }

  String get title {
    switch (this) {
      case ProviderMainPageTabsEnum.home:
        return appLocalizer.home;
      case ProviderMainPageTabsEnum.providerManagement:
        return appLocalizer.storManagement;
      case ProviderMainPageTabsEnum.myOrders:
        return appLocalizer.myOrders;
      case ProviderMainPageTabsEnum.more:
        return appLocalizer.more;
    }
  }
}
