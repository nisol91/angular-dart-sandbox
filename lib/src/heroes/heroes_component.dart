import 'package:angular/angular.dart';
import 'package:angular_dart_sandbox/src/hero_service.dart';
import 'package:angular_forms/angular_forms.dart';
import '../hero/hero_detail_component.dart';
import '../hero.dart';
import 'dart:async';
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
    providers: [ClassProvider(HeroService)])
class HeroesComponent implements OnInit {
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selected;

  HeroesComponent(this._heroService);

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlowly();
  }
}
