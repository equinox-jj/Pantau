import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension UserProfileDataModelMapper on UserProfileDataModel {
  CurrentUser toEntity() {
    return CurrentUser(
      uuid: id,
      displayName: displayName,
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
