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
        const SliverToBoxAdapter(child: AdsWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }
}
