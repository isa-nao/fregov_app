import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'issue_model.freezed.dart';
part 'issue_model.g.dart';

@freezed
class Issue with _$Issue {
  const factory Issue({
    required String cityName,
    required String issueTitle,
    required String updateTime,
    required String detailUrl,
  }) = _Issue;

  factory Issue.fromJson(Map<String, dynamic> json)
    => _$IssueFromJson(json);
}