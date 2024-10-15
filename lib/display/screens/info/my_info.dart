import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Asegúrate de agregar este paquete en pubspec.yaml
import 'package:botreal/display/widgets/app_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const MyInfo(),
    );
  }

  // Función para abrir URL (GitHub)
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  Future<void> _launchApp(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo abrir la aplicación para $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Info',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('assets/UP.png'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Universidad Politecnica de Chiapas',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Text(
              'ingenieria en Software',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '9B',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rogelio Emauel Roque Morales',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Text(
              '213532',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centra los botones
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                  color: Colors.green,
                  iconSize: 30.0,
                  onPressed: () {
                    _launchApp('whatsapp://send?phone=+529512198832');
                  },
                  tooltip: 'Abrir WhatsApp',
                ),
                const SizedBox(width: 20), // Espacio entre los botones
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {
                    _launchApp('https://github.com/EstebanMakiatoOwO/chat_bot_gemini/blob/master/lib/display/screens/chatBot/chat_bot.dart');
                  },
                  tooltip: 'Abrir GitHub',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
