import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

/// Demo application users.
enum DemoAppUser {
  michael,
  yosia,
  william,
  felix,
}

/// Convenient class Extension on [DemoAppUser] enum
extension DemoAppUserX on DemoAppUser {
  /// Convenient method Extension to generate an [id] from [DemoAppUser] enum
  String get id => {
        DemoAppUser.michael: 'michael-susanto',
        DemoAppUser.yosia: 'yosia-amadeus',
        DemoAppUser.william: 'william-willz',
        DemoAppUser.felix: 'felix-fernando',
      }[this]!;

  /// Convenient method Extension to generate a [name] from [DemoAppUser] enum
  String? get name => {
        DemoAppUser.michael: 'Michael Susanto',
        DemoAppUser.yosia: 'Yosia Amadeus',
        DemoAppUser.william: 'William Willz',
        DemoAppUser.felix: 'Felix Fernando',
      }[this];

  /// Convenient method Extension to generate [data] from [DemoAppUser] enum
  Map<String, Object>? get data => {
        DemoAppUser.michael: {
          'first_name': 'Michael',
          'last_name': 'Susanto',
          'full_name': 'Michael Susanto',
        },
        DemoAppUser.yosia: {
          'first_name': 'Yosia',
          'last_name': 'Amadeus',
          'full_name': 'Yosia Amadeus',
        },
        DemoAppUser.william: {
          'first_name': 'William',
          'last_name': 'Willz',
          'full_name': 'William Willz',
        },
        DemoAppUser.felix: {
          'first_name': 'Felix',
          'last_name': 'Fernando',
          'full_name': 'Felix Fernando',
        },
      }[this];

  /// Convenient method Extension to generate a [token] from [DemoAppUser] enum
  Token? get token => <DemoAppUser, Token>{
        // TODO: Generate your own tokens if you're using your own API key.
        DemoAppUser.michael: const Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWljaGFlbC1zdXNhbnRvIn0.NbKaxK8-pfRWKrvcOWf4Vcqn1fHnf3p-6WRMRW51u0A'),
        DemoAppUser.yosia: const Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoieW9zaWEtYW1hZGV1cyJ9.LBQkcaVkFssl9tgK9MRSC48LMrxHiHfzJSw86D7WsWc'),
        DemoAppUser.william: const Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoid2lsbGlhbS13aWx6In0.O_zjy6erHflv7slh402OcMqKe-43htZP-7oT0B9gUK0'),
        DemoAppUser.felix: const Token(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZmVsaXgtZmVybmFuZG8ifQ.a_Tm8tpUrYnRVAHnLhuV1GGRwunbmKBXMyEvG86RFpQ'),
      }[this];
}
