// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RankedJokesTable extends RankedJokes
    with TableInfo<$RankedJokesTable, RankedJoke> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RankedJokesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jokeIdMeta = const VerificationMeta('jokeId');
  @override
  late final GeneratedColumn<String> jokeId = GeneratedColumn<String>(
      'joke_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, source, jokeId, content, rating, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ranked_jokes';
  @override
  VerificationContext validateIntegrity(Insertable<RankedJoke> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('joke_id')) {
      context.handle(_jokeIdMeta,
          jokeId.isAcceptableOrUnknown(data['joke_id']!, _jokeIdMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RankedJoke map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RankedJoke(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      jokeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}joke_id']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RankedJokesTable createAlias(String alias) {
    return $RankedJokesTable(attachedDatabase, alias);
  }
}

class RankedJoke extends DataClass implements Insertable<RankedJoke> {
  final int id;
  final String source;
  final String? jokeId;
  final String content;
  final int rating;
  final DateTime createdAt;
  const RankedJoke(
      {required this.id,
      required this.source,
      this.jokeId,
      required this.content,
      required this.rating,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || jokeId != null) {
      map['joke_id'] = Variable<String>(jokeId);
    }
    map['content'] = Variable<String>(content);
    map['rating'] = Variable<int>(rating);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RankedJokesCompanion toCompanion(bool nullToAbsent) {
    return RankedJokesCompanion(
      id: Value(id),
      source: Value(source),
      jokeId:
          jokeId == null && nullToAbsent ? const Value.absent() : Value(jokeId),
      content: Value(content),
      rating: Value(rating),
      createdAt: Value(createdAt),
    );
  }

  factory RankedJoke.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RankedJoke(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      jokeId: serializer.fromJson<String?>(json['jokeId']),
      content: serializer.fromJson<String>(json['content']),
      rating: serializer.fromJson<int>(json['rating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<String>(source),
      'jokeId': serializer.toJson<String?>(jokeId),
      'content': serializer.toJson<String>(content),
      'rating': serializer.toJson<int>(rating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RankedJoke copyWith(
          {int? id,
          String? source,
          Value<String?> jokeId = const Value.absent(),
          String? content,
          int? rating,
          DateTime? createdAt}) =>
      RankedJoke(
        id: id ?? this.id,
        source: source ?? this.source,
        jokeId: jokeId.present ? jokeId.value : this.jokeId,
        content: content ?? this.content,
        rating: rating ?? this.rating,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('RankedJoke(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('jokeId: $jokeId, ')
          ..write('content: $content, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, source, jokeId, content, rating, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RankedJoke &&
          other.id == this.id &&
          other.source == this.source &&
          other.jokeId == this.jokeId &&
          other.content == this.content &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt);
}

class RankedJokesCompanion extends UpdateCompanion<RankedJoke> {
  final Value<int> id;
  final Value<String> source;
  final Value<String?> jokeId;
  final Value<String> content;
  final Value<int> rating;
  final Value<DateTime> createdAt;
  const RankedJokesCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.jokeId = const Value.absent(),
    this.content = const Value.absent(),
    this.rating = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RankedJokesCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    this.jokeId = const Value.absent(),
    required String content,
    required int rating,
    required DateTime createdAt,
  })  : source = Value(source),
        content = Value(content),
        rating = Value(rating),
        createdAt = Value(createdAt);
  static Insertable<RankedJoke> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<String>? jokeId,
    Expression<String>? content,
    Expression<int>? rating,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (jokeId != null) 'joke_id': jokeId,
      if (content != null) 'content': content,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RankedJokesCompanion copyWith(
      {Value<int>? id,
      Value<String>? source,
      Value<String?>? jokeId,
      Value<String>? content,
      Value<int>? rating,
      Value<DateTime>? createdAt}) {
    return RankedJokesCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      jokeId: jokeId ?? this.jokeId,
      content: content ?? this.content,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (jokeId.present) {
      map['joke_id'] = Variable<String>(jokeId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RankedJokesCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('jokeId: $jokeId, ')
          ..write('content: $content, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $RankedJokesTable rankedJokes = $RankedJokesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [rankedJokes];
}
