import 'package:function_and_extension_library/function_and_extension_library.dart';

enum TaskType {
  call,
  meeting,
  message,
  email,
  general;

  // override the name getter so that it will capitalize the first letter of the enum value
  // this is useful when displaying the enum value in the UI
  String get name {
    return toString().split('.').last.capitalize();
  }
}
