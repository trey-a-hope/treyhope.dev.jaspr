---
author: Trey Hope
category: coffee-code
coverImage: 1_9sHLR6ZeA6kVSo3ATCQDWQ.jpg
date: 2024-05-17
description: Master Nakama's session system for secure user authentication in game backends with practical Flutter examples.
slug: coffee-code-nakama-secure-sessions
tags: nakama, gamedev, flutter, authentication, sessions
title: Coffee & Code - Nakama Sessions & Authentication
---

![Preview image](./1_9sHLR6ZeA6kVSo3ATCQDWQ.jpg)

> Cappuccino from [**Café Zeppelin**](https://www.instagram.com/zeppelinmedellin/) in Laureles, Medellín, Colombia.
> 

In one of my most recent applications, known as Gift Grab, the concept of a user's "session" was implemented in a rather simplistic way.

![Nakama Website](./1_qIfEFVhRTBMRIDcsOmKOtQ.gif "Nakama Website")<br/>*Nakama Website*

It was solely based on whether the user had signed into the app or not.

![Nakama Sessions](./1_xbunxmCAmme08aC1jxIQzw.gif "Nakama Sessions")<br/>*Nakama Sessions*

Unfortunately, this approach did not take into account the exact moment of sign-in or the duration of the user's interaction with the app.

![Flutter UI with Sessions](./1_OaZSBSoKhhvfJsDJL2wf5Q.gif "Flutter UI with Sessions")<br/>*Flutter UI with Sessions*

However, as I delved deeper into the comprehensive and detailed documentation provided by Nakama, a realization dawned on me.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakama/nakama.dart';
import 'package:nakama_ui/data/services/hive_session_service.dart';

/// Provider used to check if the user is authenticated.
class NakamaAuthProvider extends AsyncNotifier<bool> {
  /// HiveSessionService instance.
  final _hiveSessionService = HiveSessionService();

  @override
  FutureOr<bool> build() async {
    // Initialize Nakama client.
    getNakamaClient(
      host: '127.0.0.1',
      ssl: false,
      serverKey: 'defaultkey',
      httpPort: 7350,
    );

    // Fetch the current session.
    final session = await _hiveSessionService.sessionActive();

    return session != null;
  }
}
```

It became clear that I should be leveraging the concept of sessions to manage user interactions with the app in a much more effective and efficient way.

![Nakama Leaderboards](./1_rKNEnfZl3q7P4FIFhq42-w.gif "Nakama Leaderboards")<br/>*Nakama Leaderboards*

To provide a bit of context, broadly speaking, a "session" refers to a distinct period during which a user is authenticated with a particular system.

![None](./1_xDdWr1yeJHsiK_imQ_FHDQ.gif)

It represents an established connection between the user and the system, facilitating a secure and personalized interaction.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nakama/nakama.dart';
import 'package:nakama_ui/data/services/hive_session_service.dart';

/// Provider that handles listing/creating leaderboard records.
class NakamaLeaderboardProvider extends AsyncNotifier<List<LeaderboardRecord>> {
  /// Leaderboard name.
  static const _leaderboardName = 'weekly_leaderboard';

  /// HiveSessionService instance.
  final _hiveSessionService = HiveSessionService();

  @override
  FutureOr<List<LeaderboardRecord>> build() async {
    // Fetch the current session.
    final session = await _hiveSessionService.sessionActive();

    // If session is null, return empty list.
    if (session == null) {
      return [];
    }

    // Get leaderboard records.
    final leaderboardRecordList =
        await getNakamaClient().listLeaderboardRecords(
      session: session,
      leaderboardName: _leaderboardName,
    );

    // Return leaderboard records from list.
    return leaderboardRecordList.records;
  }
}
```

In the context of Nakama, the session takes on an even more critical role. It is represented as a client-side object that authenticates the client when they are accessing server functions.

![None](./1_gRzRDHeSPoa-FQac6ZMpqw.gif)

This implementation provides a significantly more secure way for users to interact with server functions, thereby improving overall app security.

```dart
// Decode the session token.
final res = JwtDecoder.decode(session.token);

// Return session data from decoded token.
return SessionData(
  uid: res['uid'],
  username: res['usn'],
  email: res['vrs']['email'],
  expiresAt: DateTime.fromMillisecondsSinceEpoch(res['exp'] * 1000),
);
```

There is more to come on this topic, so stay tuned for more insights and revelations in the near future.