import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../hero.dart';
import '../hero_service.dart';
import '../route_paths.dart';

@Component(
    selector: 'my-dashboard',
    templateUrl: 'dashboard_component.html',
    directives: [
      coreDirectives,
      routerDirectives,
    ],
    providers: [
      ClassProvider(HeroService),
    ])
class DashboardComponent implements OnInit {
  final String title = "Top 5 Heroes";
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }
}
