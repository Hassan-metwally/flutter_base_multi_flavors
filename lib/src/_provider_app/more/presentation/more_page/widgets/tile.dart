part of '../provider_more_page.dart';

class _GroupTiles extends StatelessWidget {
  const _GroupTiles({required this.title, required this.children, this.textStyle});

  final String title;
  final TextStyle? textStyle;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.enabledBorderColor),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textStyle ?? TextStyles.regular12.copyWith(color: AppColors.grey)),
          ...children,
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  // ignore: unused_element_parameter
  const _Tile({required this.icon, required this.text, required this.onTap, this.textStyle = TextStyles.regular14, this.traillingText});

  final String icon;
  final String text;
  final String? traillingText;
  final VoidCallback onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.enabledBorderColor),
        ),
        child: Row(
          spacing: 4,
          children: [
            AppSvgIcon(path: icon, size: 16),
            Expanded(child: Text(text, style: textStyle)),
            if (traillingText != null) Text(traillingText!, style: TextStyles.regular10.copyWith(color: AppColors.black600)),
            Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
