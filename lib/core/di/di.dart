import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:media_sth/core/di/di.config.dart';

final di = GetIt.instance;

@injectableInit
FutureOr<void> configureDependencies({required String environment}) =>
    di.init(environment: environment);
