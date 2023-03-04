abstract class BaseState {
  const BaseState();
}

class onStateInitial extends BaseState {
  const onStateInitial();
}

class onStateLoading extends BaseState {
  final bool isDismisable;
  const onStateLoading({this.isDismisable = true});
}

class onStateNoAuth extends BaseState {
  const onStateNoAuth();
}

class onStateError extends BaseState {
  final String message;
  const onStateError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is onStateError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class onStateSpecificError extends BaseState {
  final int errorCode;
  final String title;
  final String message;
  final int specificErrorCode;
  const onStateSpecificError(
      {this.message = '',
      this.title = '',
      this.errorCode = 200,
      this.specificErrorCode = 0});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is onStateSpecificError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
