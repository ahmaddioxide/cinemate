
import 'package:cinemate/models/search_movie_with_keyword_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';

abstract class SearchMovieWithKeywordsRepo {
  Future<SearchMovieWithKeywordResponse> searchMovieWithKeywords(String keywords,int pageNumber);
}

class HttpSearchMoviesWithKeywords implements SearchMovieWithKeywordsRepo{

  @override
  Future<SearchMovieWithKeywordResponse> searchMovieWithKeywords(String keywords,int pageNumber) async {
    SearchMovieWithKeywordResponse searchMovieWithKeywordResponse;
    final String uri = '/search/movie?query=$keywords&language=en-US&page=$pageNumber&include_adult=false';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    searchMovieWithKeywordResponse = SearchMovieWithKeywordResponse.fromJson(response);
    return searchMovieWithKeywordResponse;
  }
}
