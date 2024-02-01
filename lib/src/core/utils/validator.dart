class Validator {
  static String? isRequired(String? value) => value?.isEmpty == true ? 'Este campo é obrigatório!' : null;
}