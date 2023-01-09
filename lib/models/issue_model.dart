import 'package:flutter/foundation.dart';

@immutable
class Issue {
  const Issue({
    required this.cityName,
    required this.issueTitle,
    required this.updateTime,
    required this.detailUrl,
  });

  final String cityName, issueTitle, updateTime, detailUrl;

  Issue copyWith({String? cityName, issueTitle, updateTime, detailUrl}) {
    return Issue(
      cityName: cityName ?? this.cityName,
      issueTitle: issueTitle ?? this.issueTitle,
      updateTime: updateTime ?? this.updateTime,
      detailUrl: detailUrl ?? this.detailUrl,
    );
  }
}