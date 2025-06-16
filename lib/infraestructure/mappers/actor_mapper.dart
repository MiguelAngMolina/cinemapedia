import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id, 
      name: cast.name, 
      profilePath: cast.profilePath != null
      ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
      : 'https://i.pinimg.com/564x/9b/c4/d0/9bc4d087682c1cf9beb9669bad13cc3c.jpg',
      character: cast.character
      );
}
