import 'package:flutter/material.dart';
import 'package:segantang_sira/state/state_base.dart';
import 'package:segantang_sira/widget.dart';

class Util {
  static void defaultProviderHandler<T>(Object? state, BuildContext context,
      {Function(T loadedState)? onLoaded,
      Function(onStateSpecificError)? onSpecificError}) {
    if (state is onStateLoading) {
      BaseDialog.showLoadingDialog(context, isDismissable: state.isDismisable);
    } else if (state is onStateError) {
      BaseDialog.dismissDialog();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          duration: const Duration(seconds: 3),
        ),
      );
    } else if (state is onStateSpecificError) {
      BaseDialog.dismissDialog();
      if (onSpecificError != null) {
        onSpecificError(state);
      } else {
        // ErrorUtil.showErrorDialog(
        //     context, state.errorCode, state.title, state.message,
        //     specificErrorCode: state.specificErrorCode);
      }
    } else if (state is T) {
      BaseDialog.dismissDialog();
      if (onLoaded != null) {
        onLoaded(state);
      }
    }
  }
}
