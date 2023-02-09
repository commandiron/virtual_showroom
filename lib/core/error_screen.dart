import 'package:flutter/material.dart';
import 'package:virtual_showroom/core/helper/url_launcher.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.errorCause, Key? key}) : super(key: key);

  final String errorCause;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox(height: double.infinity,)),
            const Text(
              "Bir hata ile karşılaşıldı, lütfen iletişime geçin.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8,),
            Text(
              "HATA: $errorCause",
              textAlign: TextAlign.center,
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: InkWell(
                onTap: () => openURL("https://www.demirli.tech"),
                splashColor: const Color(0xffF48B0B),
                child: Card(
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      "assets/demirli_tech_text_logo_black.png"
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
          ],
        ),
      ),
    );
  }
}
