import 'package:domain_models/domain_models.dart';
import 'package:function_and_extension_library/function_and_extension_library.dart';
import 'package:key_value_storage/key_value_storage.dart';

extension UserCMtoDM on UserCM {
  User toDomainModel() {
    return User(
      // id: id,
      // username: userame,
      email: email,
      // jobTitle: jobTitle,
      // phone: phone,
      // companyName: companyName,
      // companyAddress: companyAddress,
      // companyCountry: companyCountry,
      // accountName: accountName,
      // companyDomain: companyDomain,

    );
  }
}



