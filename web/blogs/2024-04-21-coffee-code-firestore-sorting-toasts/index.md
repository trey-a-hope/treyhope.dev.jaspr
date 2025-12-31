---
author: Trey Hope
category: coffee-code
coverImage: 1_YSmctWmz6H_DQRDafyqW5A.jpg
date: 2024-04-21
description: Learn to sort Firestore data with Riverpod and display toast messages in Flutter using the Toastification package.
slug: coffee-code-firestore-sorting-toasts
tags: flutter, firestore, riverpod, toastmessages, mobiledev
title: Coffee & Code - Firestore Sorting & Toast Messages
---

![Preview image](./1_YSmctWmz6H_DQRDafyqW5A.jpg)

> Mocha Latte from [**Teapot Cafe Lounge**](https://teapotcafelounge.com/) in Dayton, OH.
> 

Back on the QuoteKeeper app per usual.

![None](./1_qHzMtGyw5RzZ7p3VNjQU8w.jpg)

Some features I've been working on this sprint is the ability to sort the books and display toasts messages.

![Video Demo](./1_tK89gLMm0D5igCzhkezS8g.gif "Video Demo")<br/>*Video Demo*

For sorting, I updated the method for fetching books to accept a string query param and a boolean isDescending param.

```dart
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_keeper/data/services/book_service.dart';
import 'package:quote_keeper/domain/models/book_model.dart';
import 'package:quote_keeper/utils/config/providers.dart';

/// Fetch the next list of books using 
void getNextBooks() async {
  try {
    state = const AsyncLoading();

    // Order by term, i.e. name, author, title, etc.
    final orderBy = ref.read(Providers.bookSearchTermProvider).query;

    // Is the list descending or not.
    final descending = ref.read(Providers.bookSearchIsDescendingProvider);

    // Return the quotes for this user.    
    final uid = ref.read(Providers.authAsyncProvider.notifier).getUid();

    final querySnapshot = await _bookService.getBooks(
      orderBy: orderBy,
      descending: descending,
      uid: uid,

      // Previous firestore document used for pagination.
      lastDocument: _lastDocument,

      // Number of results to fetch with each query.=
      limit: 10,
    );

    _lastDocument = querySnapshot.docs.last;

    List<BookModel> books = _convertQuerySnapshotToBooks(querySnapshot);

    state = AsyncData([...state.value!, ...books]);
 } catch (e) {}
```

The BookSearchIsDescendingNotifier returns true/false if the list should be descending.

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the value of whether the search results are descending or not.
class BookSearchIsDescendingNotifier extends AutoDisposeNotifier<bool> {
  
  /// Default isDescending to true.
  @override
  bool build() => true;

  /// Update to the inverse of its current value.
  void toggle() => state = !state;
}
```

The BookSearchTermNotifier returns the current BookSearchTerm, (name, author, created date, or modified date).

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Options for sorting a users quotes.
enum BookSearchTerm {
  title('Title', 'title'),
  created('Created', 'created'),
  modified('Modified', 'modified'),
  author('Author', 'author');
  
  const BookSearchTerm(this.label, this.query);

  final String label;
  final String query;
}

/// Holds the current query for searching quotes.
class BookSearchTermNotifier extends AutoDisposeNotifier<BookSearchTerm> {
  // Default the book search to sort by created value.
  @override
  BookSearchTerm build() => BookSearchTerm.created;

  // Update the book search term enum value.
  void updateTerm(BookSearchTerm term) => state = term;
}
```

For displaying modal toasts, which are temporary messages displayed in the UI, I incorporated the [Toastification](https://pub.dev/packages/toastification) flutter package.

![Updating username.](./1_6mQtovDuGqpKUBVGr5sOcQ.gif "Updating username.")<br/>*Updating username.*

It is a very lightweight and flexible package for making use of toast messages.

```dart
import 'package:flutter/material.dart';
import 'package:quote_keeper/utils/constants/toast_type.dart';
import 'package:toastification/toastification.dart';

class ModalService {
  /// Displays a toast message.
  /// Takes in a required context and message.
  /// The toastType modifies ui icons and colors.
  /// The alignment determines position on screen.
  static void showToast({
    required BuildContext context,
    required String message,
    ToastType toastType = ToastType.success,
    Alignment alignment = Alignment.bottomCenter,
  }) =>
      toastification.show(
        context: context,
        style: ToastificationStyle.minimal,
        autoCloseDuration: const Duration(seconds: 5),
        title: Text(message),
        alignment: alignment,
        animationDuration: const Duration(milliseconds: 300),
        icon: toastType.icon,
        primaryColor: toastType.color,
        backgroundColor: toastType.color.shade50,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: BorderRadius.circular(12),
        showProgressBar: false,
        closeButtonShowType: CloseButtonShowType.onHover,
        closeOnClick: true,
      );
}
import 'package:flutter/material.dart';

enum ToastType {
  success(Colors.blue, Icon(Icons.check)),
  failure(Colors.red, Icon(Icons.cancel));

  const ToastType(
    this.color,
    this.icon,
  );

  final MaterialColor color;
  final Icon icon;
}
```

Version 1.7.0 now available for [iOS](https://apps.apple.com/us/app/quote-keeper-save-book-quotes/id6471941046) and [Android](https://play.google.com/store/apps/details?id=com.io.book_quotes&hl=en_US&gl=US).

That's all for right now, what are you working on? Leave a comment, I'd love to hear about it.

[#flutter](https://medium.com/tag/flutter "Flutter") [#firebase](https://medium.com/tag/firebase "Firebase") [#firestore](https://medium.com/tag/firestore "Firestore") [#galaxy-z-fold-3](https://medium.com/tag/galaxy-z-fold-3 "Galaxy Z Fold 3") [#coffee-culture](https://medium.com/tag/coffee-culture "Coffee Culture")