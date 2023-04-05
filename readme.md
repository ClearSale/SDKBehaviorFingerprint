# Exemplo Flutter SDK Behavior Clearsale

Este é um exemplo de como usar o plugin `behavior_analytics_flutter_sdk` no Flutter. O plugin `behavior_analytics_flutter_sdk` permite coletar informações do dispositivo e enviar eventos de usuário para a plataforma de análise de comportamento da Behavior.

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

## Uso do Plugin
Para usar o plugin behavior_analytics_flutter_sdk, siga os seguintes passos:

1.: Inicie o SDK usando a chave do aplicativo:

``` yaml
BehaviorAnalyticsFlutterSdk.start('sua_app_key');
```

2.: Gere um ID de sessão para o dispositivo:
``` yaml
String sessionID = await BehaviorAnalyticsFlutterSdk.generateSessionID();
```

3.: Colete informações do dispositivo:
``` yaml
BehaviorAnalyticsFlutterSdk.collectDeviceInformation(sessionID);
```


## Exemplo
Este exemplo inclui um aplicativo Flutter simples que usa o plugin behavior_analytics_flutter_sdk para enviar eventos de usuário para a plataforma de análise de comportamento da Behavior.

Para usar o exemplo, basta clonar este repositório e executar o aplicativo em seu dispositivo ou emulador Android ou iOS. Certifique-se de ter configurado o SDK com sua chave de aplicativo antes de executar o aplicativo.
