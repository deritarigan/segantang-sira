part of base_widgets;

class BaseShimmer extends StatelessWidget {
  final Widget child;
  final bool isActive;
  final Color? baseColor;
  final Color? highlightColor;

  const BaseShimmer(
      {Key? key,
      required this.child,
      this.isActive = true,
      this.baseColor,
      this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Shimmer.fromColors(
            baseColor: baseColor ?? Colors.grey[200]!,
            highlightColor: highlightColor ?? Colors.grey[100]!,
            child: child)
        : child;
  }
}
