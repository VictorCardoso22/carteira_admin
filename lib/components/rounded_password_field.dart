import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  void Function()? onEditingComplete;
  final bool readOnly;
  //final ValueChanged<String> onChanged;
   RoundedPasswordField({
    key,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.onEditingComplete
    //this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: [AutofillHints.password],
      obscureText: true,
      //onChanged: onChanged,
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      onEditingComplete: onEditingComplete,
      // onTap: () {
      //   if (readOnly == true) {
      //     toastAviso("Desabilitar logar com FaceId ou Biometria",
      //         Colors.blueAccent, context);
      //   }
      // },
      cursorColor: kPrimaryDarkColor,
      decoration: InputDecoration(
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
