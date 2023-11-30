import "package:drift/drift.dart";
import 'package:path/path.dart' as p;
import "package:drift/native.dart";
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'database.g.dart';

class RankedJokes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()();
  TextColumn get jokeId => text().nullable()();
  TextColumn get content => text()();
  IntColumn get rating => integer()();
  DateTimeColumn get createdAt => dateTime()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'favorites.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [RankedJokes])
class Database extends _$Database {

  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<RankedJoke> getBestJoke() => (select(rankedJokes)
        ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)])
        ..where((j) => j.rating.equals(5))
        ..limit(1))
      .getSingle();

  Future<int> insertJoke(RankedJokesCompanion joke) => into(rankedJokes).insert(joke);

}
