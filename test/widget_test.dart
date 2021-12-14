import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/main.dart';
import 'package:flutter_ci_cd/views/greeting_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('挨拶が表示されるテスト', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GreetingPage(),
      ),
    );

    // expect(find.text('hoge'), findsOneWidget);
    // await tester.tap(find.byType(TextButton));
    // await tester.pumpAndSettle();

    // 初期値
    expect(find.text('あいさつする'), findsOneWidget);

    // テキストフィールドに名前を入力
    await tester.enterText(
      find.byKey(
        const Key('name text field'),
      ),
      '太郎',
    );
    await tester.tap(find.text('あいさつする'));
    await tester.pump();
    expect(find.text('こんにちは太郎さん'), findsOneWidget);

    // 名前を空にすると初期表示に戻る
    await tester.enterText(
      find.byKey(
        const Key('name text field'),
      ),
      '',
    );
    await tester.tap(find.text('あいさつする'));
    await tester.pump();
    expect(find.text('名前を入力してください'), findsOneWidget);
  });
}
