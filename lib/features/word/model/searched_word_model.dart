// class SearchedWordModel {
//   List<Map>? defininitions;

//   SearchedWordModel({this.defininitions});

//   factory SearchedWordModel.fromJson(List json) {
//     return SearchedWordModel(
//         defininitions: json[0]['meanings'][0]['definitions']);
//   }
// }


class SearchedWordModel {
  List<Definition>? definitions;

  SearchedWordModel({this.definitions});

  SearchedWordModel.fromJson(Map<String, dynamic> json) {
    if (json['definitions'] != null) {
      definitions = <Definition>[];
      json['definitions'].forEach((v) {
        definitions!.add( Definition.fromJson(v));
      });
    }
  }

}

class Definition {
  String? definition;

  Definition({this.definition});

  Definition.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
  }
}