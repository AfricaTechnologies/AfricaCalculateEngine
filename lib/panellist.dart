// Expansion Panel List Widget Item
class Item {
  bool isExpanded;
  int identity;

  Item({
    required this.identity,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      identity: index,
    );
  });
}