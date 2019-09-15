import 'package:dio/dio.dart';
import 'package:flutter_github/models/github.model.dart';

class GithubService {
  final Dio dio = Dio();

  Future<GithubModel> getRepositories(String term) async {
    Response response = await dio.get('https://api.github.com/search/repositories?q=$term');
    return GithubModel.fromJson(response.data);
  }
}
