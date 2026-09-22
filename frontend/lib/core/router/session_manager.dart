import 'dart:async';

/// Broadcasts a "session expired" signal from the network layer to the router
/// without coupling networking to navigation.
class SessionManager {
  final _controller = StreamController<void>.broadcast();

  /// Emits when refresh fails and the user must re-authenticate.
  Stream<void> get onSessionExpired => _controller.stream;

  void notifyExpired() {
    if (!_controller.isClosed) _controller.add(null);
  }

  void dispose() => _controller.close();
}
