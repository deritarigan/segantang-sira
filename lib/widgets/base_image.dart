part of base_widgets;

class BaseImageWidget extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;

  const BaseImageWidget(
    this.assetPath, {
    Key? key,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSvgAsset()) {
      if (isNetworkAsset()) {
        return SvgPicture.network(
          assetPath,
          key: key,
          width: width,
          color: color,
          height: height,
          alignment: alignment ?? Alignment.center,
          fit: fit ?? BoxFit.contain,
        );
      }
      return SvgPicture.asset(
        assetPath,
        key: key,
        width: width,
        height: height,
        color: color,
        alignment: alignment ?? Alignment.center,
        fit: fit ?? BoxFit.contain,
      );
    }
    if (isNetworkAsset()) {
      return CachedNetworkImage(
        imageUrl: assetPath,
        errorWidget: (context, url, err) =>
            SvgPicture.asset('assets/vector/ic_error_image.svg'),
        placeholder: (context, url) {
          return BaseShimmer(
            child: Container(
              color: Colors.black,
            ),
          );
        },
        key: key,
        width: width,
        height: height,
        color: color,
        alignment: alignment ?? Alignment.center,
        fit: fit,
      );
    }
    return Image.asset(
      assetPath,
      key: key,
      width: width,
      height: height,
      color: color,
      alignment: alignment ?? Alignment.center,
      fit: fit,
    );
  }

  bool isSvgAsset() {
    return assetPath.endsWith('.svg');
  }

  bool isNetworkAsset() {
    return assetPath.startsWith('http');
  }
}
