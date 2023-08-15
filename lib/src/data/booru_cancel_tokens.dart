// ignore_for_file: join_return_with_assignment

import 'package:dio/dio.dart';

class BooruCancelTokens {
  CancelToken search = CancelToken();
  CancelToken count = CancelToken();
  CancelToken suggestions = CancelToken();
  CancelToken comments = CancelToken();
  CancelToken notes = CancelToken();

  void cancelSearch() {
    if (!search.isCancelled) {
      search.cancel();
    }
  }

  CancelToken recreateSearch() {
    cancelSearch();
    search = CancelToken();
    return search;
  }

  void cancelCount() {
    if (!count.isCancelled) {
      count.cancel();
    }
  }

  CancelToken recreateCount() {
    cancelCount();
    count = CancelToken();
    return count;
  }

  void cancelSuggestions() {
    if (!suggestions.isCancelled) {
      suggestions.cancel();
    }
  }

  CancelToken recreateSuggestions() {
    cancelSuggestions();
    suggestions = CancelToken();
    return suggestions;
  }

  void cancelComments() {
    if (!comments.isCancelled) {
      comments.cancel();
    }
  }

  CancelToken recreateComments() {
    cancelComments();
    comments = CancelToken();
    return comments;
  }

  void cancelNotes() {
    if (!notes.isCancelled) {
      notes.cancel();
    }
  }

  CancelToken recreateNotes() {
    cancelNotes();
    notes = CancelToken();
    return notes;
  }

  void dispose() {
    cancelSearch();
    cancelCount();
    cancelSuggestions();
    cancelComments();
    cancelNotes();
  }
}
