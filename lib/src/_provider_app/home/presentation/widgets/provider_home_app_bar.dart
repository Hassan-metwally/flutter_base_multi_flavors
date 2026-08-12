part of '../provider_home_page.dart';

class _ProviderHomeAppBar extends StatefulWidget {
  const _ProviderHomeAppBar();

  @override
  State<_ProviderHomeAppBar> createState() => _ProviderHomeAppBarState();
}

class _ProviderHomeAppBarState extends State<_ProviderHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return LoggedUserCheckerWidget(
      loggedBuilder: (user) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0).copyWith(top: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.appbarBorderColor)),
            image: DecorationImage(image: AssetImage("")),
          ),
          child: SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppRouter.pushNamed(AppRoutes.providerPersonalProfile);
                    },
                    child: Row(
                      children: [
                        (){
                          if (user.avatar.isNotEmpty) {
                            return AppImage.circle(path: user.avatar, dimension: 48);
                          } else {
                            return Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary50)),
                              child: AppSvgIcon(path: AppIcons.userOutline, size: 35),
                            );
                          }
                        }(),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(appLocalizer.welcome, style: TextStyles.regular14.copyWith(color: AppColors.primary)),
                              Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),
                NotificationButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
