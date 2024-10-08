class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String? character;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final String? placeOfBirth;

  Actor(
      {required this.id,
      required this.name,
      required this.profilePath,
      required this.character,
      this.biography = '',
      this.birthday = '',
      this.deathday = '',
      this.placeOfBirth = ''});
}
