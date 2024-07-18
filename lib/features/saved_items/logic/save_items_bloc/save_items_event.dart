part of 'save_items_bloc.dart';

abstract class SaveItemsEvent {}

class GetSavedItemsEvent extends SaveItemsEvent {}

class AddOrRemoveItemEvent extends SaveItemsEvent {
  final bool isSaved;
  final SavedItemModel savedItem;

  AddOrRemoveItemEvent({required this.isSaved, required this.savedItem});
}

class IsItemSavedEvent extends SaveItemsEvent {
  final String title;

  IsItemSavedEvent({required this.title});
}
