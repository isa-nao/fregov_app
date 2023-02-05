// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Issue _$$_IssueFromJson(Map<String, dynamic> json) => _$_Issue(
      cityName: json['cityName'] as String,
      issueTitle: json['issueTitle'] as String,
      updateTime: json['updateTime'] as String,
      detailUrl: json['detailUrl'] as String,
    );

Map<String, dynamic> _$$_IssueToJson(_$_Issue instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'issueTitle': instance.issueTitle,
      'updateTime': instance.updateTime,
      'detailUrl': instance.detailUrl,
    };
