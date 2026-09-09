import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/core.dart';
import '../../../../material/auth_states/guest_checker_widget.dart';
import '../../../../material/auth_states/unauthenticated_bottom_sheet.dart';
import '../../../../material/media/svg_icon.dart';
import '../../../../material/offstage.dart';
import '../../notifications/helpers/firebase/firebase_helper.dart';
import '../home/presentation/provider_home_page.dart';
import '../more/presentation/more_page/provider_more_page.dart';
import 'models/provider_main_page_tabs_enum.dart';
import 'observer/provider_main_page_observer.dart';

part 'widgets/provider_bottom_navigation_bar.dart';

class ProviderMainPage extends StatefulWidget {
  const ProviderMainPage({super.key});

  @override
  State<ProviderMainPage> createState() => _ProviderMainPageState();
}

class _ProviderMainPageState extends State<ProviderMainPage> with ProviderMainPageObserverMixin {
  ProviderMainPageTabsEnum _currentTabEnum = ProviderMainPageTabsEnum.home;
  final List<ProviderMainPageTabsEnum> _loadedPages = [ProviderMainPageTabsEnum.home];

  void _addUnAuthenticatedListener() {
    UnAuthenticatedInterceptor.instance.addListener(() {
      UnAuthenticatedBottomSheet.show();
    });
  }

  void _onCurrentTapChanged(ProviderMainPageTabsEnum currentTap) {
    if (!_loadedPages.contains(currentTap)) {
      _loadedPages.add(currentTap);
    }
    _currentTabEnum = currentTap;

    setState(() {});
  }

  void _onPop() {
    if (_currentTabEnum != ProviderMainPageTabsEnum.home) {
      _onCurrentTapChanged(ProviderMainPageTabsEnum.home);
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseHelper.setUpNotificationListener();
    initObserver(onTabChanged: _onCurrentTapChanged);
    _addUnAuthenticatedListener();
    // if (!GuestCheckerWidget.isGuest(context)) {
    //   PusherHandler.instance.initialize();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, _) {
          _onPop();
        },
        child: IndexedStack(
          index: _currentTabEnum.index,
          children: [
            OffStage(isActive: _currentTabEnum == ProviderMainPageTabsEnum.home, child: const ProviderHomePage()),
            OffStage(
              isActive: _currentTabEnum == ProviderMainPageTabsEnum.providerManagement,
              child: const GuestCheckerWidget(replaceWithDefaultGuestWidget: true, child: SizedBox()),
            ),

            OffStage(
              isActive: _currentTabEnum == ProviderMainPageTabsEnum.myOrders,
              child: const GuestCheckerWidget(replaceWithDefaultGuestWidget: true, child: SizedBox()),
            ),
            OffStage(isActive: _currentTabEnum == ProviderMainPageTabsEnum.more, child: const ProviderMorePage()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _ProviderBottomNavigationBar(selctedTab: _currentTabEnum, onTabChanged: _onCurrentTapChanged),
    );
  }

  @override
  void dispose() {
    super.dispose();
    UnAuthenticatedInterceptor.instance.dispose();
  }
}
