part of '../provider_main_page.dart';

class _ProviderBottomNavigationBar extends StatelessWidget {
  const _ProviderBottomNavigationBar({required this.selctedTab, required this.onTabChanged});

  final ProviderMainPageTabsEnum selctedTab;
  final ValueChanged<ProviderMainPageTabsEnum> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: AppColors.black.withOpacityPercent(8), blurRadius: 4, offset: const Offset(0, 2))],
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ProviderMainPageTabsEnum.values.map((item) {
          final bool isSelected = item == selctedTab;
          return Expanded(
            flex: isSelected ? 2 : 1,
            child: Bounce(
              onTap: () {
                onTabChanged(item);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(44)),
                  color: isSelected ? AppColors.primary : null,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvgIcon(path: !isSelected ? item.outlineIc : item.filledIc),
                    isSelected
                        ? Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 5),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,

                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.medium16.copyWith(color: AppColors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
