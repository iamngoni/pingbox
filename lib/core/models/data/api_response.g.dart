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
      'message': instance.message,
      'data': instance.data,
    };
