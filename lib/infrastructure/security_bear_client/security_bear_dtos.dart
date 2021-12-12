import 'package:cybear_jinni/domain/security_bear/security_bear_entity.dart';
import 'package:cybear_jinni/domain/security_bear/security_bear_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_bear_dtos.freezed.dart';
part 'security_bear_dtos.g.dart';

@freezed
abstract class SecurityBearDtos implements _$SecurityBearDtos {
  factory SecurityBearDtos({
    // @JsonKey(ignore: true)

    required String securityBearNetworkBssid,
    required String networkName,
    required String lastKnownIp,
    // required ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _SecurityBearDtos;

  SecurityBearDtos._();

  @override
  final String deviceDtoClassInstance = (SecurityBearDtos).toString();

  factory SecurityBearDtos.fromDomain(SecurityBearEntity securityBearDE) {
    return SecurityBearDtos(
      securityBearNetworkBssid:
          securityBearDE.securityBearNetworkBssid.getOrCrash(),
      networkName: securityBearDE.networkName.getOrCrash(),
      lastKnownIp: securityBearDE.lastKnownIp.getOrCrash(),
    );
  }

  factory SecurityBearDtos.fromJson(Map<String, dynamic> json) =>
      _$SecurityBearDtosFromJson(json);

  SecurityBearEntity toDomain() {
    return SecurityBearEntity(
      securityBearNetworkBssid:
          SecurityBearNetworkBssid(securityBearNetworkBssid),
      networkName: SecurityBearNetworkName(networkName),
      lastKnownIp: SecurityBearNetworkIp(lastKnownIp),
    );
  }
}

// class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
//   const ServerTimestampConverter();
//
//   @override
//   FieldValue fromJson(Object json) {
//     return FieldValue.serverTimestamp();
//   }
//
//   @override
//   Object toJson(FieldValue fieldValue) => fieldValue;
// }