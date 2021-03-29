import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_authentication/Setup/login.dart';

void main() {
  Widget makeTestableWidget ({Widget child}) {
    return Material(
    );
  }

  testWidgets('check login', (WidgetTester tester) async {
    LoginPage page = LoginPage();

    await tester.pumpWidget(makeTestableWidget(child: page));
  });
}
