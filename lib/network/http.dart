library http;

import 'dart:convert';
import 'dart:io';

import 'package:alice/alice.dart';
import 'package:alice/core/alice_dio_interceptor.dart';
import 'package:alice/utils/shake_detector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:segantang_sira/security/security_util.dart';

import 'package:flutter/widgets.dart';

part 'http_client.dart';
part 'interceptor.dart';
