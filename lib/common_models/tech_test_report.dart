import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class TechTestReportModel {
  final String bookingId;
  final String engineOilCheck;
  final String coolantLevelCheck;
  final String batteryHealthCheck;
  final String tirePressureCheck;
  final String tireTreadDepthCheck;
  final String exteriorLightCheck;
  final String engineLightCheck;
  final String engineNoiseCheck;
  final String engineFluidLeakCheck;
  final String beltAndHoseCheck;
  final String airFilterCheck;
  final String brakePadAndRotorCheck;
  final String brakeFluidCheck;
  final String brakeLinesCheck;
  final String brakePerformanceCheck;
  final String shockAbsorberLeakCheck;
  final String steeringComponentCheck;
  final String wheelAlignmentCheck;

  TechTestReportModel({
    required this.bookingId,
    required this.engineOilCheck,
    required this.coolantLevelCheck,
    required this.batteryHealthCheck,
    required this.tirePressureCheck,
    required this.tireTreadDepthCheck,
    required this.exteriorLightCheck,
    required this.engineLightCheck,
    required this.engineNoiseCheck,
    required this.engineFluidLeakCheck,
    required this.beltAndHoseCheck,
    required this.airFilterCheck,
    required this.brakePadAndRotorCheck,
    required this.brakeFluidCheck,
    required this.brakeLinesCheck,
    required this.brakePerformanceCheck,
    required this.shockAbsorberLeakCheck,
    required this.steeringComponentCheck,
    required this.wheelAlignmentCheck,
  });

  static TechTestReportModel empty() => TechTestReportModel(
        bookingId: '',
        engineOilCheck: '',
        coolantLevelCheck: '',
        batteryHealthCheck: '',
        tirePressureCheck: '',
        tireTreadDepthCheck: '',
        exteriorLightCheck: '',
        engineLightCheck: '',
        engineNoiseCheck: '',
        engineFluidLeakCheck: '',
        beltAndHoseCheck: '',
        airFilterCheck: '',
        brakePadAndRotorCheck: '',
        brakeFluidCheck: '',
        brakeLinesCheck: '',
        brakePerformanceCheck: '',
        shockAbsorberLeakCheck: '',
        steeringComponentCheck: '',
        wheelAlignmentCheck: '',
      );

  factory TechTestReportModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return TechTestReportModel(
        bookingId: data['BookingId'],
        engineOilCheck: data['EngineOilCheck'],
        coolantLevelCheck: data['CoolantLevelCheck'],
        batteryHealthCheck: data['BatteryHealthCheck'],
        tirePressureCheck: data['TirePressureCheck'],
        tireTreadDepthCheck: data['TireTreadDepthCheck'],
        exteriorLightCheck: data['ExteriorLightCheck'],
        engineLightCheck: data['EngineLightCheck'],
        engineNoiseCheck: data['EngineNoiseCheck'],
        engineFluidLeakCheck: data['EngineFluidLeakCheck'],
        beltAndHoseCheck: data['BeltAndHoseCheck'],
        airFilterCheck: data['AirFilterCheck'],
        brakePadAndRotorCheck: data['BrakePadAndRotorCheck'],
        brakeFluidCheck: data['BrakeFluidCheck'],
        brakeLinesCheck: data['BrakeLinesCheck'],
        brakePerformanceCheck: data['BrakePerformanceCheck'],
        shockAbsorberLeakCheck: data['ShockAbsorberLeakCheck'],
        steeringComponentCheck: data['SteeringComponentCheck'],
        wheelAlignmentCheck: data['WheelAlignmentCheck'],
      );
    } else {
      return TechTestReportModel.empty();
    }
  }

  Map<String, dynamic> toJson() => {
        'BookingId': bookingId,
        'EngineOilCheck': engineOilCheck,
        'CoolantLevelCheck': coolantLevelCheck,
        'BatteryHealthCheck': batteryHealthCheck,
        'TirePressureCheck': tirePressureCheck,
        'TireTreadDepthCheck': tireTreadDepthCheck,
        'ExteriorLightCheck': exteriorLightCheck,
        'EngineLightCheck': engineLightCheck,
        'EngineNoiseCheck': engineNoiseCheck,
        'EngineFluidLeakCheck': engineFluidLeakCheck,
        'BeltAndHoseCheck': beltAndHoseCheck,
        'AirFilterCheck': airFilterCheck,
        'BrakePadAndRotorCheck': brakePadAndRotorCheck,
        'BrakeFluidCheck': brakeFluidCheck,
        'BrakeLinesCheck': brakeLinesCheck,
        'BrakePerformanceCheck': brakePerformanceCheck,
        'ShockAbsorberLeakCheck': shockAbsorberLeakCheck,
        'SteeringComponentCheck': steeringComponentCheck,
        'WheelAlignmentCheck': wheelAlignmentCheck,
      };
}
