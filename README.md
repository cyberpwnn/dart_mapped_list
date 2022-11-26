Use Map<int, T> instead of List<T> for json patching efficiency, an extension for maps to use list methods on them when the key is an int (index)

## Usage

```dart
import 'package:mapped_list/mapped_list.dart';  

Map<int, String> mappedList = {};
mappedList.ladd('a');
mappedList.ladd('b');
mappedList.ladd('c');
mappedList.lremove('b');
mappedList.lremoveAt(0);
mappedList.linsert(0, 'd');

print(mappedList); // {0: d, 1: c}
print(mappedList.llist()); // [d,c]
```