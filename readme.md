# Exemplo Flutter SDK Behavior Clearsale

Este é um exemplo de como usar o plugin `behavior_analytics_flutter_sdk` no Flutter. O plugin `behavior_analytics_flutter_sdk` permite coletar informações do dispositivo e enviar eventos de usuário para a plataforma de análise de comportamento da Behavior.

Este exemplo inclui um aplicativo Flutter simples que usa o plugin behavior_analytics_flutter_sdk para enviar dados do dispositivo para a Clearsale.

## Configuração

Para usar este exemplo, você precisa adicionar o plugin `behavior_analytics_flutter_sdk` ao seu projeto Flutter. Para isso, basta adicionar o seguinte código ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  behavior_analytics_flutter_sdk:
    git:
      url: https://PublicPackagesCS@dev.azure.com/PublicPackagesCS/Behavior/_git/BehaviorAnalytics.SDK.Flutter
      ref: main
      version: 0.3.3
```
## Uso do App
Para executar o app é necessário clonar o repositório e executar o comando:
``` yaml
Flutter run
```
na raiz do projeto.


# Uso do plugin

Plugin Flutter do SDK Behavior Analytics da Clearsale

  ## Dependências
Inserir no pubspec.yaml a dependência a seguir:
```sh
dependencies:
	behavior_analytics_flutter_sdk:
		git:
			url: https://PublicPackagesCS@dev.azure.com/PublicPackagesCS/Behavior/_git/BehaviorAnalytics.SDK.Flutter
			ref: main
			version: 0.3.3
```

  
  

## Proguard
 

Configurações que precisam ser adicionadas ao arquivo de configuração do Proguard.
  
Obrigatário
```sh

-keep class sale.clear.behavior.android.** { *; }

-keep interface com.google.gson.annotations.Expose

-keep interface com.google.gson.annotations.SerializedName

```
Recomendado
```sh
-keepattributes Exceptions

```

  
  

## Configuração de release recomendada

Essa é uma recomendação de configuração base para a release.  

```sh

buildTypes {

release {

shrinkResources true

minifyEnabled true

proguardFiles getDefaultProguardFile('proguard-android.txt'),
	'proguard-rules.pro'
	signingConfig signingConfigs.debug 
	}
}
```

## Dados e descrição
| Dado | Descrição |
|--|--|
| SessionID | ID de sessão da coleta de device, deve ser enviado para a Clearsale tambem junto ao pedido |
| AppKey | Valor fornecido pela Clearsale, que serve para identificar a origem da coleta de device.
|||

## Implementação

#### Inicialização do SDK
```sh
import  'package:behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk.dart';

class  MyApp  extends  StatefulWidget {
@override
	_MyAppState  createState() => _MyAppState();
}

class  _MyAppState  extends  State<MyApp> {
@override
void  initState() {
	super.initState();
	BehaviorAnalyticsFlutterSdk.start("appkey_fornecido_pela_clearsale");
}

```
#### Coleta de device
Exemplo de coleta
```sh

void _handleButtonPress() {
    BehaviorAnalyticsFlutterSdk.generateSessionID().then((sessionID) {
        BehaviorAnalyticsFlutterSdk.collectDeviceInformation(sessionID);

        print(sessionID);

        setState(() {
          _sessionID = sessionID;
        });
    });
}

@override
Widget build(BuildContext context) {
	print('build');
	return MaterialApp(
		home: Scaffold(
		appBar: AppBar(
			title: const Text('BehaviorAnalytics Plugin Example'),
		),
		body: Center(
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text('SessionID: $_sessionID\n'),
				ElevatedButton(
				onPressed: _handleButtonPress,
				child: Text('Coletar'),
				),
			],
			),
		),
		),
	);
}

Para usar o exemplo, basta clonar este repositório e executar o aplicativo em seu dispositivo ou emulador Android ou iOS. Certifique-se de ter configurado o SDK com sua chave de aplicativo antes de executar o aplicativo.
