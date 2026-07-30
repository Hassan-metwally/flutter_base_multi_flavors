part of '../provider_more_page.dart';

class _UseCard extends StatelessWidget {
  const _UseCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: LoggedUserCheckerWidget(
        loggedBuilder: (user) {
          return _LoggedUserCard(user: user);
        },
        guestWidget: const _GuestCard(),
      ),
    );
  }
}

class _LoggedUserCard extends StatelessWidget {
  const _LoggedUserCard({required this.user});

  final CachedUser user;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlideWithOpacityWidget(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.enabledBorderColor),
        ),
        child: Row(
          spacing: 10,
          children: [
            AppImage.circle(
              path: user.avatar,
              dimension: 56,
              border: Border.all(color: AppColors.primary50),
              placholderWidget: AppSvgIcon(path: ""),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: TextStyles.light14, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(
                    user.mobile,
                    style: TextStyles.regular12.copyWith(color: AppColors.black800),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.providerPersonalProfile);
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(80, 40),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              child: Row(
                spacing: 4,
                children: [
                  AppSvgIcon(path: ""),
                  Text(appLocalizer.edit, style: TextStyles.regular12.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuestCard extends StatelessWidget {
  const _GuestCard();

  @override
  Widget build(BuildContext context) {
    return AnimatedSlideWithOpacityWidget(
      child: Bounce(
        onTap: () {
          AppAuthenticationBloc.of(context).add(const LoggedOutEvent());
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(12), boxShadow: [AppColors.boxShadow]),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appLocalizer.userName, style: TextStyles.light14),
                    Text(appLocalizer.phoneNumber, style: TextStyles.light12.copyWith(color: AppColors.primary800)),
                  ],
                ),
              ),
              AppSvgIcon(path: "", size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
