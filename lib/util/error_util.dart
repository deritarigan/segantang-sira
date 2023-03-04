// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:auto_route/src/router/auto_router_x.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keychain/flutter_keychain.dart';

// import 'cache_util.dart';

// class ErrorUtil {
//   static const int ERROR_DEFAULT = 000;
//   static const int ERROR_SERVER = 500;
//   static const int ERROR_USER = 400;

//   static const int ERROR_USER_EMAIL_NOT_VERIFIED = 1022;
//   static const int WALLET_NEED_LOGIN = 1025;
//   static const int ERROR_UNCOMPLETE_PROFILE = 1024;

//   static showErrorDialog(
//     BuildContext context,
//     int errorCode,
//     String title,
//     String description, {
//     int specificErrorCode = 000,
//     bool isUseSecondaryButton = false,
//     String? primaryButtonLabel,
//     String? secondaryButtonLabel,
//     Function? onDismissed,
//     Function()? onTap,
//     Function()? secondaryOnTap,
//     bool isDismissAble = true,
//   }) {
//     String imageAsset = '';
//     String? buttonLabel = primaryButtonLabel;

//     if (errorCode == ErrorUtil.ERROR_USER) {
//       imageAsset = Assets.iconErrorUserSvg;
//       switch (specificErrorCode) {
//         case ERROR_USER_EMAIL_NOT_VERIFIED:
//           {
//             buttonLabel = 'Verifikasi Email';
//             onDismissed = () {
//               Future.wait([
//                 FlutterKeychain.get(key: Constant.KEY_EMAIL),
//                 CacheUtil.getBoolean(Constant.KEY_IS_VERIFIED),
//               ]).then((value) {
//                 context.router.push(ChangeEmailRoute(
//                     email: value[0].toString(), isVerified: value[1] as bool));
//               });
//             };
//             break;
//           }
//         case ERROR_UNCOMPLETE_PROFILE:
//           {
//             buttonLabel = 'Lengkapi Profil';
//             onDismissed = () async {
//               final values = await Future.wait<dynamic?>([
//                 CacheUtil.getInt(Constant.KEY_GENDER),
//                 CacheUtil.getInt(Constant.KEY_PROVINCE_ID),
//                 CacheUtil.getInt(Constant.KEY_CITY_ID),
//                 CacheUtil.getInt(Constant.KEY_DISTRICT_ID),
//                 CacheUtil.getInt(Constant.KEY_SUB_DISTRICT_ID),
//                 FlutterKeychain.get(key: Constant.KEY_RELIGION),
//                 FlutterKeychain.get(key: Constant.KEY_MARITAL_STATUS),
//               ]);
//               logger(values.toString());
//               context.router.push(ChangeProfileRoute(
//                 gender: values[0] ?? 0,
//                 provinceId: values[1] ?? 0,
//                 cityId: values[2] ?? 0,
//                 districtId: values[3] ?? 0,
//                 subDistrictId: values[4] ?? 0,
//                 religion: values[5] ?? '',
//                 maritalStatus: values[6] ?? '',
//               ));
//             };
//             break;
//           }
//       }
//     } else if (errorCode == ErrorUtil.ERROR_SERVER) {
//       imageAsset = Assets.iconErrorServerSvg;
//     } else {
//       imageAsset = Assets.iconErrorServerSvg;
//     }
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       isDismissible: isDismissAble,
//       builder: (BuildContext modalContext) {
//         return VentenyErrorDialog(
//           title: title,
//           description: description,
//           imageAsset: imageAsset,
//           buttonLabel: buttonLabel,
//           isUseSecondaryButton: isUseSecondaryButton,
//           secondaryButtonLabel: secondaryButtonLabel,
//           onTap: onTap,
//           secondaryOnTap: secondaryOnTap,
//         );
//       },
//     ).whenComplete(() {
//       if (onDismissed != null) {
//         onDismissed();
//       }
//     });
//   }

//   static handleConnectionError(Object e, VentenyState state) {
//     switch (e) {
//       case SocketException.closed():
//         {
//           state = onStateError('');
//           break;
//         }
//       default:
//         {
//           break;
//         }
//     }
//   }
// }
