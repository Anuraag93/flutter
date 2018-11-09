library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:hacker_news/src/article.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Article,
])

/// Collection of generated serializers for the built_json chat example.
Serializers serializers = _$serializers;

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
