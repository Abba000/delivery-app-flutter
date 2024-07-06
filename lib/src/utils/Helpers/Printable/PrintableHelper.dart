// ignore_for_file: avoid_print, file_names

/*
 Para pintar en consola con un color específico usamos los Ansi Colors Codes
 Para más códigos de color puedes buscar info aquí:
 https://www.codegrepper.com/code-examples/java/ansi+colors
*/

class Printable {
  static printMessageOnConsole(String message, String? keyword) {
    // ignore: unnecessary_brace_in_string_interps
    print('\x1B[33mDELIVERY- ${keyword ?? ""} - ${message}\x1B[0m');
  }

  static printErrorOnConsole(String message, String? keyword) {
    // ignore: unnecessary_brace_in_string_interps
    print('\x1B[31mDELIVERY- ${keyword ?? ""} - ${message}\x1B[0m');
  }
}
