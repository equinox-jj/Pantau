/// The signed-in user's account type, mirrors the backend `role` claim.
enum UserRole {
  user('USER'),
  resolver('RESOLVER'),

  /// Fallback for a server role this build does not know yet, or no cached
  /// profile at all.
  unknown('UNKNOWN');

  const UserRole(this.slug);

  /// Wire value used by the API.
  final String slug;

  /// Parses a wire value, falling back to [UserRole.unknown].
  static UserRole fromSlug(String? slug) {
    if (slug == null) return UserRole.unknown;
    final normalized = slug.trim().toLowerCase();

    for (final role in UserRole.values) {
      if (role.slug.toLowerCase() == normalized) return role;
    }

    return UserRole.unknown;
  }
}
