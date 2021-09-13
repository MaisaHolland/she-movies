class DirectorModel{
  String? biography;
  String? birthday;
  String? deathday;
  int? gender;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  String? profilePath;

  DirectorModel(
      {
        this.biography,
        this.birthday,
        this.deathday,
        this.gender,
        this.id,
        this.imdbId,
        this.knownForDepartment,
        this.name,
        this.placeOfBirth,
        this.profilePath});

  DirectorModel.fromJson(Map<String, dynamic> json) {
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['biography'] = this.biography;
    data['birthday'] = this.birthday;
    data['deathday'] = this.deathday;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['place_of_birth'] = this.placeOfBirth;
    data['profile_path'] = this.profilePath;
    return data;
  }
}