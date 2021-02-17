import 'package:clock_app/models/Patient.dart';
import 'package:clock_app/services/patientService.dart';
import 'dart:async';

class PatientController {

  final PatientService _patientService =  PatientService();

  Future<List<Patient>> getPatientNameList() async {
    return this._patientService.getPatientList();
  }
    Future<int> insertPatient( patient) async {
      return this._patientService.insertPatient(patient);
    }
      Future<int> updatePatient(Patient patient) async {
        return this._patientService.updatePatient(patient);
      }
        Future<int> deletePatient(int id) async {
          return this._patientService.deletePatient(id);
        }

  Future<List<Map<String, dynamic>>> getPatientMapList() async {
    return this._patientService.getPatientMapList();

  }
  Future<List<Patient>> getPatientList() async {
    return this._patientService.getPatientList();

  }
  }