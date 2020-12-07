import 'dart:convert';
import 'dart:io';
import 'package:bodecom/src/models/loginModel.dart';
import 'package:bodecom/src/utils/PostLogin.dart';
import 'package:http/http.dart' as http;
import 'package:bodecom/src/blocs/login_bloc.dart';
import 'package:bodecom/src/utils/ApiData.dart';
import 'package:flutter/material.dart';
import 'package:bodecom/src/blocs/provider.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginform(context),
        ],
      ),
    );
  }

  _crearFondo(context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor('#1E264A')),
    );

    return Stack(
      children: [
        fondoMorado,
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Image.asset('assets/logoBodecom.png',
                  // color: Colors.white,
                  height: 100),
              SizedBox(
                height: 5.0,
                width: double.infinity,
              ),
            ],
          ),
        )
      ],
    );
  }

  _loginform(context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 130.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: HexColor('#2E78EF'),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        'Bienvenido',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'INGRESA',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 60.0,
                ),
                _crearEmail(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearBoton(bloc),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '¿Olvidó Contraseña?',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Image.asset('assets/logoFaoCompleto.png',
              // color: Colors.white,
              height: 100),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }

  _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: snapshot.error,
                // icon: Icon(
                //   Icons.alternate_email,
                //   color: HexColor('#2E78EF'),
                // ),
                hintText: 'ejemplo@mail.com',
                labelText: 'Correo Electronico',
                counterText: snapshot.data,
              ),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: snapshot.error,
              // icon: Icon(
              //   Icons.lock,
              //   color: HexColor('#2E78EF'),
              // ),
              labelText: 'Password',
              counterText: snapshot.data,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 0.0,
          color: HexColor('#1E264A'),
          textColor: Colors.white,
          onPressed:
              snapshot.hasData ? () => login_con_api(bloc, context) : null,
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
    print('============');
    print('Email: ${bloc.email} ');
    print('password: ${bloc.password}');
    print('============');
  }

  // ignore: non_constant_identifier_names
  login_con_api(LoginBloc bloc, BuildContext context) async {
    var client = http.Client();
    try {
      var uriResponse = await client.post(ApiData.login,
          body: {'email': bloc.email, 'password': bloc.password});
      List listaResponseLogin = jsonDecode(uriResponse.body);
      List<LoginModel> listaLogin = new List();
      listaLogin = listaResponseLogin
          .map((mapLogin) => new LoginModel.fromJson(mapLogin))
          .toList();

      if (listaLogin[0].respuestaLogin == ApiData.loginSuccess) {
        Fluttertoast.showToast(
            msg: "Bienvenido.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        // Mostrar mensaje de error.
        Fluttertoast.showToast(
            msg: "Error, el usuario y la contraseña no coinciden.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      client.close();
    }
  }
}
