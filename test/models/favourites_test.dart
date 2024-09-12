import 'package:test/test.dart';
import 'package:testing_app/models/favourites.dart';

void main() {
  group('Testing App Provider', () {
    var favourites = Favourites();
    test('a new item should be added', () {
      var number = 35;
      favourites.add(number);
      expect(favourites.items.contains(number), true);
    });
    test('An item should be removed', () {
      var number = 45;
      favourites.add(number);
      expect(favourites.items.contains(number), true);
      favourites.remove(number);
      expect(favourites.items.contains(number), false);
    });
  });
}
