import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/profile/presentation/widgets/profile_widgets.dart';

const _app = MaterialApp(home: Scaffold(body: ProfileIdentityCard()));

/// Passed straight to `pumpWidget` so the scope is the root one; riverpod_lint
/// treats a `ProviderScope` built elsewhere as a nested scope.
Future<void> _pumpCard(WidgetTester tester, CurrentUser user) =>
    tester.pumpWidget(
      ProviderScope(
        overrides: [currentUserProvider.overrideWith((ref) async => user)],
        child: _app,
      ),
    );

void main() {
  testWidgets('shows initials when there is no avatar', (tester) async {
    await _pumpCard(tester, const CurrentUser(displayName: 'Jane Doe'));
    await tester.pumpAndSettle();

    expect(find.text('JD'), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('falls back to initials when the avatar fails to load', (
    tester,
  ) async {
    await _pumpCard(
      tester,
      const CurrentUser(
        displayName: 'Jane Doe',
        avatarUrl: 'http://invalid.test/a.png',
      ),
    );
    await tester.pump();
    expect(find.byType(Image), findsOneWidget);

    // The test binding's HttpClient answers every request with a 400, so
    // the image errors and errorBuilder takes over.
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 200)),
    );
    await tester.pumpAndSettle();

    expect(find.text('JD'), findsOneWidget);
  });
}
