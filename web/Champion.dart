class Champion {
  int id;
  String name;
  String key;
  List<String> tags;
  List<String> roles;
  String image;
  String version;

  Champion(String key, Map data) {
    this.key = key;
    this.version = data['version'];
    _buildChampion(data['data'][key]);
  }

  void _buildChampion(Map data) {
    tags = data['tags'];
    id = data['id'];
    name = data['name'];
    image = data['image']['full'];
  }

  String toString() {
    return "Id: " + id.toString() +
      "\nName: " + name + "\n" +
      "\nTags: " + tags.toString() + "\n" +
      "\nImage: " + image + "\n" +
      "\nVersion: " + version + "\n";
  }
}