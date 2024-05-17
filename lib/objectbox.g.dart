// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/model/transaction_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 6857592870651390975),
      name: 'TransactionEntity',
      lastPropertyId: const obx_int.IdUid(4, 6661890949522588999),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 9012025760434007287),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5197951084237977755),
            name: 'category',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8169017978825115644),
            name: 'amount',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6661890949522588999),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 6857592870651390975),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    TransactionEntity: obx_int.EntityDefinition<TransactionEntity>(
        model: _entities[0],
        toOneRelations: (TransactionEntity object) => [],
        toManyRelations: (TransactionEntity object) => {},
        getId: (TransactionEntity object) => object.id,
        setId: (TransactionEntity object, int id) {
          object.id = id;
        },
        objectToFB: (TransactionEntity object, fb.Builder fbb) {
          final categoryOffset = fbb.writeString(object.category);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, categoryOffset);
          fbb.addFloat64(2, object.amount);
          fbb.addInt64(3, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final categoryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final amountParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final dateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final object = TransactionEntity(
              id: idParam,
              category: categoryParam,
              amount: amountParam,
              date: dateParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [TransactionEntity] entity fields to define ObjectBox queries.
class TransactionEntity_ {
  /// See [TransactionEntity.id].
  static final id =
      obx.QueryIntegerProperty<TransactionEntity>(_entities[0].properties[0]);

  /// See [TransactionEntity.category].
  static final category =
      obx.QueryStringProperty<TransactionEntity>(_entities[0].properties[1]);

  /// See [TransactionEntity.amount].
  static final amount =
      obx.QueryDoubleProperty<TransactionEntity>(_entities[0].properties[2]);

  /// See [TransactionEntity.date].
  static final date =
      obx.QueryDateProperty<TransactionEntity>(_entities[0].properties[3]);
}
