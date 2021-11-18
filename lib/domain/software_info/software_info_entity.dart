import 'package:cybear_jinni/domain/software_info/software_info_failures.dart';
import 'package:cybear_jinni/domain/software_info/software_info_value_objects.dart';
import 'package:cybear_jinni/infrastructure/core/gen/cbj_app_server/protoc_as_dart/cbj_app_connections.pbgrpc.dart';
import 'package:cybear_jinni/infrastructure/software_info/software_info_dtos.dart';
import 'package:dartz/dartz.dart';

class SoftwareInfoEntity {
  SoftwareInfoEntity({
    required this.deviceName,
    required this.pubspecYamlVersion,
    required this.protoLastGenDate,
    required this.compId,
    required this.compUuid,
    required this.compOs,
    required this.compModel,
    required this.compType,
    required this.compIp,
  });

  factory SoftwareInfoEntity.empty() => SoftwareInfoEntity(
        deviceName: SoftwareInfoDeviceName(''),
        pubspecYamlVersion: SoftwareInfoPubspecYamlVersion(''),
        protoLastGenDate: SoftwareInfoProtoLastGenDate(''),
        compId: SoftwareInfoCompId(''),
        compUuid: SoftwareInfoCompUuid(''),
        compOs: SoftwareInfoCompOs(''),
        compModel: SoftwareInfoCompModel(''),
        compType: SoftwareInfoCompType(''),
        compIp: SoftwareInfoCompIp(''),
      );

  factory SoftwareInfoEntity.compAppInfo(CompAppInfo compAppInfo) {
    final CbjAppIno cbjAppIno = compAppInfo.cbjInfo;

    final CompAppSpecs compAppSpecs = compAppInfo.compSpecs;

    return SoftwareInfoEntity(
      deviceName: SoftwareInfoDeviceName(cbjAppIno.deviceName),
      pubspecYamlVersion:
          SoftwareInfoPubspecYamlVersion(cbjAppIno.pubspecYamlVersion),
      protoLastGenDate:
          SoftwareInfoProtoLastGenDate(cbjAppIno.protoLastGenDate),
      compId: SoftwareInfoCompId(compAppSpecs.compId),
      compUuid: SoftwareInfoCompUuid(compAppSpecs.compUuid),
      compOs: SoftwareInfoCompOs(compAppSpecs.compOs),
      compModel: SoftwareInfoCompModel(compAppSpecs.compModel),
      compType: SoftwareInfoCompType(compAppSpecs.compType),
      compIp: SoftwareInfoCompIp(compAppSpecs.compIp),
    );
  }

  SoftwareInfoDeviceName deviceName;
  SoftwareInfoPubspecYamlVersion pubspecYamlVersion;
  SoftwareInfoProtoLastGenDate protoLastGenDate;
  SoftwareInfoCompId compId;
  SoftwareInfoCompUuid compUuid;
  SoftwareInfoCompOs compOs;
  SoftwareInfoCompModel compModel;
  SoftwareInfoCompType compType;
  SoftwareInfoCompIp compIp;

  Option<SoftwareInfoFailures<dynamic>> get failureOption {
    return deviceName.value.fold((f) => some(f), (_) => none());
  }

  @override
  SoftwareInfoDtos toInfrastructure() {
    return SoftwareInfoDtos(
      deviceName: deviceName.getOrCrash(),
      pubspecYamlVersion: pubspecYamlVersion.getOrCrash(),
      protoLastGenDate: protoLastGenDate.getOrCrash(),
      compId: compId.getOrCrash(),
      compUuid: compUuid.getOrCrash(),
      compOs: compOs.getOrCrash(),
      compModel: compModel.getOrCrash(),
      compType: compType.getOrCrash(),
      compIp: compIp.getOrCrash(),
    );
  }
}
