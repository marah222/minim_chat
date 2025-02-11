import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '../minimal_chat/secret.env')  //Path of your secret.env file
abstract class Env{
  @EnviedField(varName: 'FIREBASE_API_KEY',obfuscate: true)
  static String myApiKey=_Env.myApiKey;

  @EnviedField(varName: 'FIREBASE_ios_API_KEY',obfuscate: true)
  static String myIosApiKey=_Env.myIosApiKey;
}
