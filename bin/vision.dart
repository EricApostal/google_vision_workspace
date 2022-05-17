import 'package:args/command_runner.dart';
import 'package:google_vision/google_vision.dart';
import 'package:universal_io/io.dart';

void main(List<String> arguments) async {
  CommandRunner('vision',
      'A command line interface for making API requests to the Google Vision service with cli commands.')
    ..argParser.addOption('credential-file',
        defaultsTo: '${Util.userHome}/.vision/credentials.json',
        valueHelp: 'credentials file path')
    ..addCommand(VisionDetectCommand())
    ..addCommand(VisionScoreCommand())
    ..addCommand(VisionHighlightCommand())
    ..run(arguments).catchError((error) {
      if (error is! UsageException) throw error;

      print(error);

      exit(64); // Exit code 64 indicates a usage error.
    });
}
