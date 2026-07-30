part of '../provider_home_page.dart';

class _ProviderHomeBody extends StatefulWidget {
  const _ProviderHomeBody();

  @override
  State<_ProviderHomeBody> createState() => _ProviderHomeBodyState();
}

class _ProviderHomeBodyState extends State<_ProviderHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiquidPullToRefresh(
        backgroundColor: AppColors.primary,
        color: Colors.transparent,
        showChildOpacityTransition: false,
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              // ProviderStatisticsWidget(key: UniqueKey()),
              const SizedBox(height: 16),
              _ServiceOrdersSection(key: UniqueKey()),
              const SizedBox(height: 16),
              // _ProductsOrdersSection(key: UniqueKey()),
              // const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
