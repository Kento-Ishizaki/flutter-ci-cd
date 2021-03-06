import 'package:flutter_ci_cd/models/greeting.dart';
import 'package:flutter_ci_cd/models/greeting.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  test('挨拶は「こんにちは名前さん」である', () {
    final _greeting = Greeting();
    final _result = _greeting.greeting('太郎');
    expect(_result, 'こんにちは太郎さん');
  });

  test('名前が空文字のときは「名前を入力してください」となる', () {
    final _greeting = Greeting();
    final _result = _greeting.greeting('');
    expect(_result, '名前を入力してください');
  });

  test('モックテスト', () async {
    final _greeting = MockGreeting();
    when(_greeting.slowGreeting()).thenAnswer(
      (_) async => await Future.value('こんばんは'),
    );
    final _result = await _greeting.slowGreeting();
    expect(_result, 'こんばんは');
  });
}
