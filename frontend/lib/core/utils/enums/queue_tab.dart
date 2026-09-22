/// The three segments of a resolver's queue, mirrors the backend `QueueTab`
/// enum and is sent verbatim as the `tab` query parameter.
enum QueueTab {
  open('OPEN', 'Open'),
  inProgress('IN_PROGRESS', 'In progress'),
  resolved('RESOLVED', 'Resolved');

  const QueueTab(this.slug, this.label);

  /// Wire value used by the API — matches the Java enum constant name
  /// exactly (Spring binds the query param via `Enum.valueOf`, which is
  /// case-sensitive).
  final String slug;

  /// Always rendered on the tab segment.
  final String label;
}
