part of '../client_home_page.dart';

class _ClientHomeBody extends StatefulWidget {
  const _ClientHomeBody();

  @override
  State<_ClientHomeBody> createState() => _ClientHomeBodyState();
}

class _ClientHomeBodyState extends State<_ClientHomeBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _Ads()),

        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}

class _Ads extends StatelessWidget {
  const _Ads();

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //   child: BlocBuilder<ClientHomeCubit, ClientHomeState>(
    //     builder: (context, state) {
    //       if (state.getAdvertismentsState.isLoading) {
    //         return const HomeAdsSliderLoadingWidget();
    //       } else if (state.getAdvertismentsState.isFailure) {
    //         return HomeAdsSliderErrorWidget(
    //           onRetry: () {
    //             context.read<ClientHomeCubit>().getAdvertisments();
    //           },
    //         );
    //       } else if (state.getAdvertismentsState.isSuccess) {
    //         final ads = state.getAdvertismentsState.data ?? [];
    //         return HomeAdsSliderWidget(sliders: ads);
    //       } else {
    //         return const SizedBox();
    //       }
    //     },
    //   ),
    // );
    return const SizedBox();
  }
}
