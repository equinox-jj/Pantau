import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/data/model/model.dart';

extension UserProfileModelMapper on UserProfileModel {
  CurrentUser toEntity() {
    return CurrentUser(
      uuid: id,
      displayName: displayName,
      avatarUrl: avatarUrl,
      createdAt: _parseDate(joinedAt),
      reportsCount: reportsCount,
      resolvedCount: resolvedCount,
    );
  }
}

DateTime? _parseDate(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) {
    return DateTime.tryParse(value);
  }

  return null;
}
