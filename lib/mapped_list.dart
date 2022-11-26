library mapped_list;

extension XMapListed<T> on Map<int, T> {
  int lindexOf(T t) {
    for (int i = 0; i < length; i++) {
      if (this[i] == t) {
        return i;
      }
    }

    return -1;
  }

  bool lremove(T t) {
    int index = lindexOf(t);
    if (index == -1) {
      return false;
    }

    lremoveAt(index);
    return true;
  }

  T lremoveAt(int index) {
    List<T> l = llist();
    clear();
    T t = l.removeAt(index);
    lfromList(l);
    return t;
  }

  void ladd(T t) {
    this[length] = t;
  }

  void linsert(int index, T t) {
    if (index == length) {
      ladd(t);
      return;
    }

    List<T> l = llist();
    clear();
    l.insert(index, t);
    lfromList(l);
  }

  void lfromList(List<T> list) {
    for (int i = 0; i < list.length; i++) {
      ladd(list[i]);
    }
  }

  T last() => this[length - 1]!;

  List<T> llist() {
    List<T> after = <T>[];

    for (int i = 0; i < length; i++) {
      after.add(lget(i));
    }

    return after;
  }

  T lget(int index) {
    if (!containsKey(index)) {
      throw Exception('Index out of bounds');
    }

    return this[index]!;
  }

  T lset(int index, T value) {
    if (length + 1 < index || index < 0) {
      throw Exception('Index out of bounds');
    }

    return this[index] = value;
  }
}
