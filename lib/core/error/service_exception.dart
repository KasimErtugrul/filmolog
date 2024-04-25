

import '../core.dart';

class ServiceException implements Exception {
  final ErrorHandleApi errorHandle;
  const ServiceException(this.errorHandle);
}
