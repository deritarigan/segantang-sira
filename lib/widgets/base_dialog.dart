part of base_widgets;

class BaseDialog {
  static BuildContext? _loadingContext;
  static bool _isShow = false;

  static void dismissDialog({BuildContext? dialogContext}) {
    if (_isShow && _loadingContext != null) {
      try {
        Navigator.pop(_loadingContext!);
      } catch (e) {
        // Navigator.pop(appRouter.navigatorKey.currentContext!);
      }
      _isShow = false;
      _loadingContext = null;
    }
  }

  static void showLoadingDialog(BuildContext cntx,
      {bool isDismissable = true}) async {
    if (!_isShow) {
      _isShow = true;
      showDialog(
          barrierColor: Colors.black12,
          context: cntx,
          barrierDismissible: isDismissable,
          builder: (context) {
            _loadingContext = cntx;
            return SpinKitRing(
                color: Theme.of(context).primaryColor, lineWidth: 4);
          }).whenComplete(() {
        _isShow = false;
      });
    }
  }
}
