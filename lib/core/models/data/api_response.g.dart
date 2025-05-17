// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$APIResponseImpl _$$APIResponseImplFromJson(Map<String, dynamic> json) =>
    _$APIResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$$APIResponseImplToJson(_$APIResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.message case final value?) 'message': value,
      if (instance.data case final value?) 'data': value,
    };
