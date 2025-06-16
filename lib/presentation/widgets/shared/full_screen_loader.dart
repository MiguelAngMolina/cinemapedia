import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando Peliculas',
      'Comprando palomitas owo',
      'Como ta muchacho',
      'Yo a utede lo veo muy bien',
      'Utede han trabajao muy bien',
      'Creo que se merecen una recompensa',
      'Que tal pal de chicles'
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere porfa owo'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando ....');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
