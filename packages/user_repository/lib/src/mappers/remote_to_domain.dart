import 'package:mira_api/mira_api.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:function_and_extension_library/function_and_extension_library.dart';

extension UserRMtoDM on UserRM {
  User toDomainModel() {
    return User(
      // id: id,
      username: username,
      email: email,
      // phone: phone,
    );
  }
}
//
// extension UsersRMtoDM on List<UserRM> {
//   List<User> toDomainModel() => map((e) => e.toDomainModel()).toList();
// }
//
// extension TaskRMtoDM on TaskRM {
//   Task toDomainModel() {
//     return Task(
//       id: id,
//       name: name,
//     );
//   }
// }
//
// extension TasksRMtoDM on List<TaskRM> {
//   List<Task> toDomainModel() => map((e) => e.toDomainModel()).toList();
// }
//
// extension DealRMtoDM on DealRM {
//   Deal toDomainModel() {
//     return Deal(
//       id: id,
//       name: name ?? '----',
//       value: value != null ? double.tryParse(value!) : null,
//     );
//   }
// }
//
// extension DealsRMtoDM on List<DealRM> {
//   List<Deal> toDomainModel() => map((e) => e.toDomainModel()).toList();
// }
//
// extension ContactRMtoDM on ContactRM {
//   Contact toDomainModel() {
//     return Contact(
//       id: id is String ? int.parse(id) : id as int,
//       name: name,
//       lastName: lastName ?? 'lastName',
//     );
//   }
// }
//
// extension ContactsRMtoDM on List<ContactRM> {
//   List<Contact> toDomainModel() => map((e) => e.toDomainModel()).toList();
// }
//
// extension CompanyRMtoDM on CompanyRM {
//   Company toDomainModel() {
//     return Company(
//       id: id,
//       name: name,
//     );
//   }
// }
//
// extension CompaniesRMtoDM on List<CompanyRM> {
//   List<Company> toDomainModel() => map((e) => e.toDomainModel()).toList();
// }
//
// extension DealStageRMtoDM on DealStageRM {
//   DealStage toDomainModel(String color) {
//     return DealStage(
//       id: id,
//       name: name == null ? 'Generation' : name!,
//       color: hexToColor(color),
//     );
//   }
// }
//
// extension LifeCyclesRMtoDM on LifeCyclesRM {
//   LifeCycles toDomainModel() {
//     return LifeCycles(
//       contact: contact,
//       company: company,
//       deal: deal,
//     );
//   }
// }
//
// extension DealStageListRMtoDM on List<DealStageRM> {
//   List<DealStage> toDomainModel() {
//     List<Color> initialColors = [
//       const Color(0xFF5F45BF),
//       const Color(0xFF6D48B2),
//       const Color(0xFF7D4BA4),
//       const Color(0xFFA25383),
//       const Color(0xFFBA586D),
//       const Color(0xFFD95E52),
//     ];
//     Color adjustColor(Color color, double factor) {
//       final hsl = HSLColor.fromColor(color);
//       return hsl
//           .withLightness((hsl.lightness * factor).clamp(0.0, 1.0))
//           .toColor();
//     }
//
//     List<Color> dealStageColors = List.generate(100, (index) {
//       if (index < initialColors.length) {
//         return initialColors[index];
//       }
//       final baseColor = initialColors[index % initialColors.length];
//       final factor = 1.0 + ((index ~/ initialColors.length) * 0.1);
//       return adjustColor(baseColor, factor);
//     });
//
//     String colorToHexString(Color color) {
//       return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
//     }
//
//     // final dealStages = List.generate(
//     //   length,
//     //   (index) => index == 0
//     //       ? DealStage(
//     //           id: -1,
//     //           name: 'All',
//     //           color: colorToHex(dealStageColors[0]),
//     //         )
//     //       : this[index].toDomainModel(
//     //           colorToHex(
//     //             dealStageColors[index],
//     //           ),
//     //         ),
//     // );
//     List<DealStage> dealStages = [];
//     for (int i = 0; i < length; i++) {
//       final hexColor = colorToHexString(dealStageColors[i + 1]);
//       if (this[i].name != null) {
//         dealStages.add(this[i].toDomainModel(hexColor));
//       }
//     }
//     dealStages.insert(
//       0,
//       DealStage(
//         id: -1,
//         name: 'All',
//         color: dealStageColors[0],
//       ),
//     );
//     return dealStages;
//   }
// }
