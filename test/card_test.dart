import 'package:etiya_case_study/presentation/widgets/game_list/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Card Widget test', (tester) async {
    await tester.pumpWidget(const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          body: GameCard(
            poster: "test",
            name: "Gta",
            rating: "3",
          ),
        ),
      ),
    ));

    final nameFinder = find.text("Gta");
    final ratingFinder = find.text('3');
    expect(nameFinder, findsOneWidget);
    expect(ratingFinder, findsOneWidget);
  });
}
