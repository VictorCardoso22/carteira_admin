import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final bool readOnly;
  //final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    key,
    this.readOnly = false,
    this.controller,
    this.validator,
    //this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      //onChanged: onChanged,
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      // onTap: () {
      //   if (readOnly == true) {
      //     toastAviso("Desabilitar logar com FaceId ou Biometria",
      //         Colors.blueAccent, context);
      //   }
      // },
      cursorColor: kPrimaryDarkColor,
      decoration: new InputDecoration(
        labelText: 'Senha',
        border: OutlineInputBorder(),
        filled: true,
        //fillColor: kSupportLightColor.withAlpha(60),
        prefixIcon:
            Icon(Icons.lock, color: Theme.of(context).colorScheme.primary),
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
