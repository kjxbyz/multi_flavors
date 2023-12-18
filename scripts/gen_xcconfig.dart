import 'dart:io';

import 'package:args/args.dart';

const flavorArgName = 'flavor';
const buildModeArgName = 'mode';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addOption(
      flavorArgName,
      abbr: 'f',
      allowed: ['external', 'internal'],
      defaultsTo: 'internal',
      help: 'flavor名字',
    )
    ..addOption(
      buildModeArgName,
      abbr: 'm',
      allowed: ['debug', 'release'],
      defaultsTo: 'debug',
      help: '目标环境',
    );

  final argResults = parser.parse(arguments);
  final flavor = argResults[flavorArgName];
  if (!['external', 'internal'].contains(flavor)) {
    throw Exception("The value of flavor must be `external` or `internal`");
  }

  final buildMode = argResults[buildModeArgName];
  if (!['debug', 'release'].contains(buildMode)) {
    throw Exception("The value of build mode must be `debug` or `release`");
  }

  final commonConfigFile = File('ios/Flutter/Common.xcconfig');
  if (commonConfigFile.existsSync()) {
    commonConfigFile.deleteSync();
  }
  commonConfigFile.createSync(recursive: true);
  commonConfigFile.writeAsStringSync(genConfigContent(flavor, buildMode));
}

String genConfigContent(
  String flavor,
  String buildMode,
) =>
    '''
#include? "Pods/Target Support Files/Pods-$flavor/Pods-$flavor.$buildMode.xcconfig"
''';
