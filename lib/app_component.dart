import 'package:angular/angular.dart';
import 'src/heroes/heroes_component.dart';
import 'package:angular_router/angular_router.dart';
import 'src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives, HeroesComponent],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Tour of Heroes';

  // Nothing here yet. All logic is in TodoListComponent.
}
