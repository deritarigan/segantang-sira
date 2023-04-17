part of base_widgets;

class BaseTapWidget extends StatelessWidget {
  const BaseTapWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final Function()? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            child: InkWell(borderRadius: borderRadius, onTap: onTap),
          ),
        )
      ],
    );
  }
}
