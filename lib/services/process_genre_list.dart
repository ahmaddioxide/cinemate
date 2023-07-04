
import 'package:cinemate/models/genre_model.dart';

class ProcessGenre {
  static String processGenreList(List<Genre>? list) {
    String genres='';
    if(list!=null){
      for(int i=0;i<list.length;i++){
        genres+=list[i].name;
        if(i!=list.length-1){
          genres+=', ';
        }
      }
    }
    return genres;
  }
}