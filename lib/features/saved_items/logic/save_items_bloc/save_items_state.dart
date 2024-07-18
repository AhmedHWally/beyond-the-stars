part of 'save_items_bloc.dart';

abstract class SaveItemsState {}

class SaveItemsInitial extends SaveItemsState {}

class GetSavedItemsLoading extends SaveItemsState {}

class GetSavedItemsSuccess extends SaveItemsState {
  final List<SavedItemModel> savedItems;

  GetSavedItemsSuccess({required this.savedItems});
}

class GetSavedItemsFailed extends SaveItemsState {
  final String errMessage;

  GetSavedItemsFailed({required this.errMessage});
}

class IsItemSaved extends SaveItemsState {
  final bool isItemSaved;

  IsItemSaved({required this.isItemSaved});
}
