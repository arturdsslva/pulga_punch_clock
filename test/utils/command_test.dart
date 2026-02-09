import 'package:flutter_test/flutter_test.dart';
import 'package:pulga_punch_clock/utils/command.dart';
import 'package:pulga_punch_clock/utils/result.dart';

void main() {
  group('Command0 -', () {
    test('should complete void command', () async {
      final command = Command0<void>(() => Future.value(Result.ok(null)));

      await command.execute();

      expect(command.completed, isTrue);
    });
    test('should complete bool command', () async {
      final command = Command0<bool>(() => Future.value(Result.ok(true)));

      await command.execute();

      expect(command.completed, isTrue);
      expect(command.result!.asOk.value, isTrue);
    });
    test('running should be true', () async {
      final command = Command0<void>(() => Future.value(Result.ok(null)));

      final future = command.execute();

      expect(command.running, isTrue);

      await future;

      expect(command.running, isFalse);
    });

    test('should only run once', () async {
      var count = 0;
      final command = Command0<int>(() => Future.value(Result.ok(count++)));

      final future = command.execute();

      command.execute();
      command.execute();
      command.execute();
      command.execute();

      await future;

      expect(count, 1);
    });

    test('should handle errors', () async {
      final command = Command0<int>(
        () => Future.value(Result.error(Exception('ERROR'))),
      );

      await command.execute();

      expect(command.error, true);
      expect(command.result, isA<Error>());
    });
  });

  group('Command1 -', () {
    test('should complete void command, bool argument', () async {
      final command = Command1<void, bool>((a) {
        expect(a, true);
        return Future.value(Result.ok(null));
      });

      await command.execute(true);

      expect(command.completed, isTrue);
    });

    test('should complete bool command, bool argument', () async {
      final command = Command1<bool, bool>(
        (a) => Future.value(Result.ok(true)),
      );

      await command.execute(true);

      expect(command.completed, isTrue);
      expect(command.result!.asOk.value, isTrue);
    });
  });
}
