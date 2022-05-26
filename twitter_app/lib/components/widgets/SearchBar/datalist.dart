List<ListWords> listWords = [
  ListWords('Account', 'OneWord definition'),
  ListWords('Password', 'TwoWord definition.'),
  ListWords('Deactivate', 'TreeWord definition'),
];

class ListWords {
  String titlelist;
  String definitionlist;

  ListWords(String titlelist, String definitionlist) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }
}
