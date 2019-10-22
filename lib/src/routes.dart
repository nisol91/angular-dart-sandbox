import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'heroes/heroes_component.template.dart' as heroes_component_template;

export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: heroes_component_template.HeroesComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    heroes,
  ];
}
