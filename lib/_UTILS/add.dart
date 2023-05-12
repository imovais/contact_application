// function add a item into a Recent Screen
import 'package:contact_app/_UTILS/data.dart';

void ontabrecenthistory(int index, String name, String phone) {
  Data.recenthistory.add({'name': name, 'phone': phone});
}

void addtofavorite(int index, String name, String phone) {
  Data.favourites.add({'name': name, 'phone': phone});
}
