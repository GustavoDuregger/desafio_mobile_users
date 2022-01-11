// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_provider.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String? name;
  final String? picture;
  final String? gender;
  User({this.name, this.picture, this.gender});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String?>(picture);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String?>(gender);
    }
    return map;
  }

  UserDataClassCompanion toCompanion(bool nullToAbsent) {
    return UserDataClassCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      name: serializer.fromJson<String?>(json['name']),
      picture: serializer.fromJson<String?>(json['picture']),
      gender: serializer.fromJson<String?>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String?>(name),
      'picture': serializer.toJson<String?>(picture),
      'gender': serializer.toJson<String?>(gender),
    };
  }

  User copyWith({String? name, String? picture, String? gender}) => User(
        name: name ?? this.name,
        picture: picture ?? this.picture,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, picture, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.name == this.name &&
          other.picture == this.picture &&
          other.gender == this.gender);
}

class UserDataClassCompanion extends UpdateCompanion<User> {
  final Value<String?> name;
  final Value<String?> picture;
  final Value<String?> gender;
  const UserDataClassCompanion({
    this.name = const Value.absent(),
    this.picture = const Value.absent(),
    this.gender = const Value.absent(),
  });
  UserDataClassCompanion.insert({
    this.name = const Value.absent(),
    this.picture = const Value.absent(),
    this.gender = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<String?>? name,
    Expression<String?>? picture,
    Expression<String?>? gender,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (picture != null) 'picture': picture,
      if (gender != null) 'gender': gender,
    });
  }

  UserDataClassCompanion copyWith(
      {Value<String?>? name, Value<String?>? picture, Value<String?>? gender}) {
    return UserDataClassCompanion(
      name: name ?? this.name,
      picture: picture ?? this.picture,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String?>(picture.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String?>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataClassCompanion(')
          ..write('name: $name, ')
          ..write('picture: $picture, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $UserDataClassTable extends UserDataClass
    with TableInfo<$UserDataClassTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserDataClassTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [name, picture, gender];
  @override
  String get aliasedName => _alias ?? 'user_data_class';
  @override
  String get actualTableName => 'user_data_class';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserDataClassTable createAlias(String alias) {
    return $UserDataClassTable(_db, alias);
  }
}

abstract class _$DatabaseProvider extends GeneratedDatabase {
  _$DatabaseProvider(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserDataClassTable userDataClass = $UserDataClassTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDataClass];
}
