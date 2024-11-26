import 'dart:convert';
import 'package:mira_api/mira_api.dart';
import 'package:key_value_storage/key_value_storage.dart';



//
extension UserRMtoCM on UserRM {
  String toCacheModel() => json.encode(toJson());
}

// extension UserFavVouchersRMtoCM on List<VoucherRM>? {
//   FavVouchersCM toCacheModel() => FavVouchersCM(
//     list: this
//         ?.map((voucher) => voucher.toDomainModel().toCacheModel())
//         .toList() ??
//         [],
//   );
// }
//
// extension UserFavVendorsRMtoCM on List<VendorRM>? {
//   FavVendorsCM toCacheModel() => FavVendorsCM(
//     list: this
//         ?.map((vendor) => vendor.toDomainModel().toCacheModel())
//         .toList() ??
//         [],
//   );
// }
