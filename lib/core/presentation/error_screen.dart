import 'package:flutter/material.dart';
import 'package:virtual_showroom/core/presentation/helper/url_launcher.dart';

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
              "Hata: $errorCause",
              textAlign: TextAlign.center,
            ),
            const Expanded(child: SizedBox(height: double.infinity,)),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey.shade50
                  )
                ),
                onPressed: () => openURL("https://www.demirli.tech"),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(
                    "assets/images/app/demirli_tech_logo/demirli_tech_text_logo_black.png"
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
