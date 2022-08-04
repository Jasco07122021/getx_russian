import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneMask {
  static MaskTextInputFormatter maskPhoneNumber = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
