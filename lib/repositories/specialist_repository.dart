import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:telemedicina_mobile_test/models/card_specialist_list_model.dart';
import 'package:telemedicina_mobile_test/models/home_specialist_model.dart';

import 'dio_client.dart';

class SpecialistRepository {
  final DioClient _dioClient;

  SpecialistRepository(
    this._dioClient,
  );

  final String listSpecialistHome = "/api/specialist-home";
  final String listSpecialistHeart = "/api/list_specialist_heart";
  final String listSpecialistDentalCare =
      "/api/list_specialist_dental_care.json";
  final String listSpecialistDermatology =
      "/api/list_specialist_dermatology.json";

  // fetch na lista de cards de especialidades da Home
  Future<List<HomeSpecialistModel>> getHomeSpecialist() async {
    try {
      Response responseApi = await _dioClient.dio.get(listSpecialistHome);
      return List.from(responseApi.data)
          .map((specialist) => HomeSpecialistModel.fromJson(specialist))
          .toList();
    } catch (error, st) {
      log(
        "Um erro ocorreu ao tentar buscar os dados de Specialist Home",
        error: error,
        stackTrace: st,
      );
      rethrow;
    }
  }

  // fetch na lista somente de Especialistas Odontológicos
  Future<List<CardSpecialistListModel>> getSpecialistDentalCare() async {
    try {
      Response responseApi = await _dioClient.dio.get(listSpecialistDentalCare);
      return List.from(responseApi.data)
          .map((specialistDental) =>
              CardSpecialistListModel.fromJson(specialistDental))
          .toList();
    } catch (error, st) {
      log(
        "Um erro ocorreu ao tentar buscar os dados de Specialist DentalCare",
        error: error,
        stackTrace: st,
      );
      rethrow;
    }
  }

  // fetch na lista somente de Especialistas Cardíacos
  Future<List<CardSpecialistListModel>> getSpecialistHeart() async {
    try {
      Response responseApi = await _dioClient.dio.get(listSpecialistHeart);
      return List.from(responseApi.data)
          .map((specialistHeart) =>
              CardSpecialistListModel.fromJson(specialistHeart))
          .toList();
    } catch (error, st) {
      log(
        "Um erro ocorreu ao tentar buscar os dados de Specialist Heart",
        error: error,
        stackTrace: st,
      );
      rethrow;
    }
  }

  // fetch na lista somente de Especialistas Dermatológicos
  Future<List<CardSpecialistListModel>> getSpecialistDermatology() async {
    try {
      Response responseApi =
          await _dioClient.dio.get(listSpecialistDermatology);
      return List.from(responseApi.data)
          .map((specialistDermatology) =>
              CardSpecialistListModel.fromJson(specialistDermatology))
          .toList();
    } catch (error, st) {
      log(
        "Um erro ocorreu ao tentar buscar os dados de Specialist Dermatology",
        error: error,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
