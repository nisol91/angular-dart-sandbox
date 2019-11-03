import 'package:angular/angular.dart';
import 'package:angular_dart_sandbox/src/hero_service.dart';
import 'package:angular_dart_sandbox/src/route_paths.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import '../hero/hero_detail_component.dart';
import '../hero.dart';
import '../hero_service.dart';

@Component(
  selector: 'heroes',
  styleUrls: ['heroes_component.css'],
  templateUrl: 'heroes_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    HeroDetailComponent,
  ],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroesComponent implements OnInit {
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selected;
  int number;
  final Router _router;

  HeroesComponent(this._heroService, this._router);

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
    number = heroes.length;
  }

  String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
