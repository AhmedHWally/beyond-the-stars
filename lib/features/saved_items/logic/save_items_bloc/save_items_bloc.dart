import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:beyond_the_stars/features/saved_items/data/repos/local_database_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'save_items_event.dart';
part 'save_items_state.dart';

class SaveItemsBloc extends Bloc<SaveItemsEvent, SaveItemsState> {
  SaveItemsBloc(this.localDatabaseRepo) : super(SaveItemsInitial()) {
    on<GetSavedItemsEvent>(_getSavedItems);
    on<IsItemSavedEvent>(_isItemSaved);
    on<AddOrRemoveItemEvent>(_addOrRemoveItem);
  }
  final LocalDatabaseRepo localDatabaseRepo;

  _getSavedItems(GetSavedItemsEvent event, Emitter<SaveItemsState> emit) async {
    var result = await localDatabaseRepo.getSavedItems();
    result.fold(
        (failure) => emit(GetSavedItemsFailed(errMessage: failure.message)),
        (items) {
      print(items.length);
      emit(GetSavedItemsSuccess(savedItems: items));
    });
  }

  _isItemSaved(IsItemSavedEvent event, Emitter<SaveItemsState> emit) async {
    var result = await localDatabaseRepo.isSaved(event.title);
    result.fold(
        (failure) => emit(GetSavedItemsFailed(errMessage: failure.message)),
        (isItemSaved) => emit(IsItemSaved(isItemSaved: isItemSaved)));
  }

  _addOrRemoveItem(
      AddOrRemoveItemEvent event, Emitter<SaveItemsState> emit) async {
    var result = await localDatabaseRepo.saveOrDeleteItem(
        event.isSaved, event.savedItem);
    result.fold(
        (failure) => emit(GetSavedItemsFailed(errMessage: failure.message)),
        (isItemSaved) => emit(IsItemSaved(isItemSaved: isItemSaved)));
  }
}
