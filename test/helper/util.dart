import 'dart:io';

Future<String> getJson(String name) async {
  var file = File('test/json/$name');
  return await file.readAsString();
}
