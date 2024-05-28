import 'dart:async';


import 'package:app_repo/app_repo.dart';


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {

  LoginCubit(this.repo) : super(const LoginState());


  final AppRepo repo;


  FutureOr<void> initData() => repo.initData();


  FutureOr<void> register(JsonMap data) async {

    emit(state.copyWith(status: LoginStatus.loading));


    final response = await repo.registerEmployee(data);


    emit(

      state.copyWith(

        status: response.success ? LoginStatus.success : LoginStatus.error,

        message: response.message,

      ),

    );

  }

FutureOr<void> fertchBanks() async {

    emit(state.copyWith(status: LoginStatus.loadingBank));


    final response = await repo.ferctchBanks();
    if (response.success){
      final banks = (response.data as List<JsonMap>).map(Bank.fromJson).toList();
      print( 'banks$banks');
      emit( state.copyWith(status: LoginStatus.SuccessBank,
      banks: banks,
      ));
    }else{
      emit(state.copyWith(status: LoginStatus.error,
      message: response.message,
      ));
    }


   

  }


  FutureOr<void> login(JsonMap data) async {

    emit(state.copyWith(status: LoginStatus.loading));


    final response = await repo.login(data);


    if (response.success) {

      await repo.initNetworkApi();


      emit(

        state.copyWith(

          status: LoginStatus.success,

          message: response.message,

        ),

      );

    } else {

      emit(

        state.copyWith(status: LoginStatus.error, message: response.message),

      );

    }

  }

}

