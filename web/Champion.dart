class Champion {
  int id;
  String name;
  List<String> tags;
  String image;

  Champion(String name, Map data) {
    this.name = name;
    _buildChampion(data);
  }

  void _buildChampion(Map data) {
    tags = data['tags'];
    id = data['id'];
    image = data['image']['full'];
  }

  String toString() {
    return "Id: " + id.toString() +
      "\nName: " + name + "\n" +
      "\nTags: " + tags.toString() + "\n" +
      "\nImage: " + image + "\n";
  }
}