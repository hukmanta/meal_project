import 'dart:developer';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

/// utility list yang bisa digunakan untuk segala jenis Object [T]
class ListUtil<T> {
  late IList<T> items;

  ListUtil() {
    items = <T>[].lock;
  }

  /// menambahkan  [item] ke list [items] jika @param [isReplace] diset true
  /// element terkahir dalam list akan dihapus dan kemudian baru ditambahkan
  List<T> addOrReplaceItem(T item, {bool isReplace = false}) {
    List<T> addNewItems = items.unlock;
    if (items.isEmpty) {
      addNewItems.add(item);
    } else {
      if (isReplace && items.length > 1) {
        addNewItems.removeLast();
      }
      addNewItems.add(item);
    }
    return addNewItems;
  }

  /// menambahkan  list[datas] ke list [items] jika @param [currentPage] diset selain 1
  /// list [datas] akan ditambahkan ke list [items]
  /// dan jika 1 list [items] akan diganti oleh list [datas]
  IList<T> addOrRenewList(List<T> datas, {int currentPage = 1}) {
    List<T> addNewItems = items.unlock;
    log('addOrRenewList ${items.length}');
    if (currentPage == 1) {
      addNewItems.clear();
    }
    addNewItems.addAll(datas);
    return addNewItems.lock;
  }
}
