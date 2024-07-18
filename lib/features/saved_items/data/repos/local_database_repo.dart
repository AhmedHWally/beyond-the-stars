import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/local_database_failure.dart';
import 'package:beyond_the_stars/core/helpers/database_helper.dart';
import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseRepo {
  final DataBaseHelper dataBaseHelper;

  LocalDatabaseRepo({required this.dataBaseHelper});

  Future<Either<Failure, List<SavedItemModel>>> getSavedItems() async {
    try {
      final savedItems = await dataBaseHelper.getSavedItems();
      return right(savedItems);
    } catch (error) {
      if (error is DatabaseException) {
        return left(DatabaseFailure.fromException(error));
      } else {
        return left(DatabaseFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, bool>> isSaved(String title) async {
    try {
      final savedItem = await dataBaseHelper.isSaved(title);
      return Right(savedItem);
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }

  Future<Either<Failure, bool>> saveOrDeleteItem(
      bool isSaved, SavedItemModel item) async {
    try {
      if (isSaved) {
        await dataBaseHelper.delete(item.title);
        return const Right(false);
      } else {
        await dataBaseHelper.saveItem(item);
        return const Right(true);
      }
    } catch (error) {
      return Left(DatabaseFailure(error.toString()));
    }
  }
}
