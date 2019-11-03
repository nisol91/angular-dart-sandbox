import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'heroes/heroes_component.template.dart' as heroes_component_template;
import 'hero/hero_detail_component.template.dart'
    as hero_detail_component_template;
import 'dashboard/dashboard_component.template.dart'
    as dashboard_component_template;

export 'route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_component_template.DashboardComponentNgFactory,
  );

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: heroes_component_template.HeroesComponentNgFactory,
  );
  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_detail_component_template.HeroDetailComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
    heroes,
    hero,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
