import 'package:eten/screens/account_screen.dart';
import 'package:eten/screens/favorites_screen.dart';
import 'package:eten/screens/search_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:eten/main.dart' as app;

void main() {
  group('Eten App', (){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Given user is in homepage When image ribbon is tapped Then Recipe Screen is shown', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final ribbon = find.byKey(ValueKey('Ribbon'));
      final ingredients = find.byKey(ValueKey('Ingredients'));

      await tester.tap(ribbon);
      await tester.pumpAndSettle();

      expect(ingredients, findsOneWidget);
    });

    testWidgets('Given user is in homepage When tab bar search tab is tapped Then Search Screen is shown', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final searchBtn = find.byTooltip('Search');
      final screen = find.byType(SearchScreen);

      await tester.tap(searchBtn);
      await tester.pumpAndSettle();

      expect(screen, findsOneWidget);
    });

    testWidgets('Given user is in homepage When tab bar favorite tab is tapped Then Favorites Screen is shown', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final favoriteBtn = find.byTooltip('Favorite');
      final screen = find.byType(FavoritesScreen);

      await tester.tap(favoriteBtn);
      await tester.pumpAndSettle();

      expect(screen, findsOneWidget);
    });

    testWidgets('Given user is in homepage When tab bar account tab is tapped Then Account Screen is shown', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final accountBtn = find.byTooltip('Account');
      final screen = find.byType(AccountScreen);

      await tester.tap(accountBtn);
      await tester.pumpAndSettle();

      expect(screen, findsOneWidget);
    });

    testWidgets('Given user is in search screen When the ingredient field is empty and search button is tapped Then error snackbar is shown', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final searchBtn = find.byTooltip('Search');
      final searchIngredientBtn = find.byTooltip('SearchIngredient');
      final snackbar = find.byType(SnackBar);

      await tester.tap(searchBtn);
      await tester.pumpAndSettle();
      await tester.tap(searchIngredientBtn);
      await tester.pumpAndSettle();

      expect(snackbar, findsOneWidget);
    });

  });
}