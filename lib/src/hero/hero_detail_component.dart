import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import '../hero.dart';
import '../hero_service.dart';
import '../route_paths.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'hero-detail',
    styleUrls: ['hero_detail_component.css'],
    templateUrl: 'hero_detail_component.html',
    directives: [coreDirectives, formDirectives],
    providers: [
      ClassProvider(HeroService),
    ])
class HeroDetailComponent implements OnActivate {
  final HeroService _heroService;
  final Location _location;
  Hero hero;
  HeroDetailComponent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  void goBack() => _location.back();
}
