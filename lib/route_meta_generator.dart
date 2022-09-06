import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_router/route/meta/route_meta.dart';
import 'package:source_gen/source_gen.dart';

class RouteAutoWiredGenerator extends GeneratorForAnnotation<RouteAutoWired> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    StringBuffer autoWiredText = StringBuffer("");
    for (var element in RouteMetaResource.routeMetaImportList) {
      autoWiredText.writeln("import 'package:$element';");
    }
    autoWiredText.write("void routesAutoWired() {");
    for (var element in RouteMetaResource.routeMetaMethodList) {
      autoWiredText.write(element);
    }
    autoWiredText.write("}");
    return autoWiredText.toString();
  }
}

class RouteGenerator extends GeneratorForAnnotation<RouteMeta> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    String autoWiredText =
        "import 'package:flutter_router/route/route_match.dart';";
    if (element.kind == ElementKind.CLASS) {
      final String pagePackage;
      RouteMetaResource.routeMetaImportList.add(
          "${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '').replaceAll(".dart", ".route.g.dart")}");
      if (buildStep.inputId.path.contains('lib/')) {
        pagePackage =
            "package:${buildStep.inputId.package}/${buildStep.inputId.path.replaceFirst('lib/', '')}";
      } else {
        pagePackage = buildStep.inputId.path;
      }

      autoWiredText += "import '$pagePackage';"
          "void autoRoutes${element.name}Generate() {";
      RouteMetaResource.routeMetaMethodList
          .add("autoRoutes${element.name}Generate();");
      autoWiredText +=
          "RouteMatch.getInstance().routes['${annotation.read("url").stringValue}'] = RouteHandler((parameters, context) => "
          "${element.name}(";
      for (var e in ((element as ClassElement).fields)) {
        autoWiredText += "parameters?['${e.name}'],";
      }
      autoWiredText += "));";
    }
    autoWiredText += "}";
    return autoWiredText;
  }
}

Builder routeBuilder(BuilderOptions options) =>
    LibraryBuilder(RouteGenerator(), generatedExtension: ".route.g.dart");

Builder routeAutoWiredBuilder(BuilderOptions options) =>
    LibraryBuilder(RouteAutoWiredGenerator(),
        generatedExtension: ".routes.g.dart");
