import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final bool readOnly;

  //final ValueChanged<String> onChanged;
  const RoundedInputField({
    key,
    this.readOnly = false,
    this.labelText,
    this.icon = Icons.person,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    //this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const <String>[
        AutofillHints.username,
        AutofillHints.email
        ],
      //onChanged: onChanged,
      readOnly: readOnly,
      // onTap: () {
      //   if (readOnly == true) {
      //     toastAviso("Desabilitar logar com FaceId ou Biometria",
      //         Colors.blueAccent, context);
      //   }
      // },
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: kPrimaryDarkColor,
      onEditingComplete: (){},

      decoration:  InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
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
        filled: true,
        //fillColor: kSurfaceVariantColor,
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
