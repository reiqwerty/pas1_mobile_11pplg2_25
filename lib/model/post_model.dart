class PostModel {
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strDescriptionEN;

  PostModel({
    required this.strTeam, required this.strStadium, required this.strBadge, required this.strDescriptionEN,
  });
  
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        strTeam: json['strTeam'],
        strStadium: json['strStadium'],
        strBadge: json ['strBadge'],
        strDescriptionEN: json ['strDescriptionEN'],
    );
  }
}