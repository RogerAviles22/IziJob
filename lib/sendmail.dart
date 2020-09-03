import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void enviarMail() async{
  final smtpServer = gmail('izijoblp@gmail.com', "Lebron23\$");
  final message = Message()
    ..from = Address('izijoblp@gmail.com', 'IZIJOB')
    ..recipients.add('victormoyanosalazar@gmail.com')
    ..ccRecipients.addAll(['victormoyanosalazar@gmail.com'])
    ..bccRecipients.add(Address('victormoyanosalazar@gmail.com'))
    ..subject = '¡Bienvenido a IziJob! 😀 La fecha de tu registro es: ${DateTime.now()}'
    ..text = 'Pilas con esa plata.\nVergeles si responde.'
    ..html = "<h1>Estas advertido</h1>\n<p>Cuidado pana! </p>";

    try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }




}

