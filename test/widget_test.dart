import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:port_folio/app.dart';

void main() {
  testWidgets('portfolio shell renders primary sections', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProviderScope(child: PortfolioApp()));

    expect(find.text('Dipendra Bogati'), findsWidgets);
    expect(find.text('Flutter & iOS Developer'), findsOneWidget);
    expect(find.text('About'), findsWidgets);
    expect(find.text('Skills'), findsWidgets);
    expect(find.text('Projects'), findsWidgets);
    expect(find.text('Education'), findsWidgets);
  });
}
