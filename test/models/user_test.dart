import 'package:flutter_ci_cd/models/user.dart';
import 'package:test/test.dart';

void main() {
  test('ユーザーが正常に作成される', () {
    final _user = User(id: '1', name: 'ishizaki');
    expect(_user.id, '1');
    expect(_user.name, 'ishizaki');
  });

  test('複数のユーザーインスタンスが正常に作成される', () {
    final _userNames = ['太郎', '花子', 'james'];
    final _users = [];
    for (final name in _userNames) {
      final _user = User(id: '1', name: name);
      _users.add(_user);
    }
    expect(_users.length, _userNames.length);
  });
}
