import 'package:mockito/annotations.dart';

class Greeting {
  String greeting(String name) {
    if (name.isEmpty) {
      return '名前を入力してください';
    }
    return 'こんにちは$nameさん';
  }

  Future<String> slowGreeting() async {
    await Future.delayed(const Duration(seconds: 10));
    return 'こんにちは';
  }
}

@GenerateMocks([Greeting])
void main() {}
