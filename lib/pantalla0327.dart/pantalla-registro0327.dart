import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({Key? key}) : super(key: key);

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarcontrasenaController =
      TextEditingController();

  bool isVisibleObsecure = false;

  void _submittedForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Cuenta Creada"),
      ));
    }
  }

  String? validateNombre(String? value) {
    if (value!.isEmpty) {
      return "Ingresa nombre";
    } else if (RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return "Por favor ingresa un nombre valido con numeros y caracteres especiales";
    }
    return null;
  }

  String? validateCorreo(String? value) {
    if (value!.isEmpty) {
      return "Ingresa tu correo";
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Por favor ingresa un correo valido";
    }
    return null;
  }

  String? validateContrasena(String? value, String? text) {
    if (value!.isEmpty) {
      return "Ingresa tu contraseña";
    } else if (value.length < 6) {
      return "Por favor ingrese una contraseña con al menos 6 caracteres";
    } else if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
      return "La contraseña debe contener solo letras y numeros";
    }
    return null;
  }

  String? validateConfirmarContrasena(String? value, String? text) {
    if (value!.isEmpty) {
      return "Confirma tu contraseña";
    } else if (value != text) {
      return "La contraseña no coincide";
    }
    return validateContrasena(value, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage("assets/ferrari.png")),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Crear Nueva Cuenta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff972626),
                              height: 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) => validateNombre(value),
                          controller: _nombreController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Nombre"),
                        ),
                        TextFormField(
                          validator: (value) => validateCorreo(value),
                          controller: _correoController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "Correo"),
                        ),
                        TextFormField(
                          validator: (value) => validateContrasena(
                              value, _contrasenaController.text),
                          controller: _contrasenaController,
                          autocorrect: false,
                          enableSuggestions: false,
                          obscureText: isVisibleObsecure,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleObsecure = !isVisibleObsecure;
                                  });
                                },
                                icon: isVisibleObsecure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              prefixIcon: Icon(Icons.password),
                              hintText: "Contraseña"),
                        ),
                        TextFormField(
                          autocorrect: false,
                          enableSuggestions: false,
                          obscureText: isVisibleObsecure,
                          validator: (value) => validateConfirmarContrasena(
                              value, _contrasenaController.text),
                          controller: _confirmarcontrasenaController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: "Confirmar Contraseña"),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff972626),
                                minimumSize: Size(300, 50)),
                            onPressed: () {
                              _submittedForm();
                            },
                            child: Text(
                              "Crear Cuenta",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
