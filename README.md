# PlatformChannel: Como estabelecer uma comunicação entre o Flutter e o código nativo

Este tópico tem como objetivo documentar e explicar como funciona o processo de estabelecer uma comunicação entre uma aplicação Flutter e
o código nativo através do mecanismo de platfochannel.

Os métodos que serão abordados funcionam tanto para se comunicar em Kotlin quanto Swift. Contudo, os exemplos abaixo são focados na
plataforma android, pois conseguimos mostrar exemplos mais interessantes com os recursos disponiveis no emulador, pois o simulador do iOS é limitado em relação a recursos como conectividade com sensores, por exemplo.

## Exemplos que essa aplicação oferece
1 - Modificar o brilho da tela do sistema operacional do android através de um componente no flutter.

2 - Utilizar o emulador do android para mudar os valores do sensor de temperatura ambiente e mostrar o valor da temperatura atual em tempo real no Flutter.


## Teoria

O diagrama abaixo representa como funciona a comunicação. O client, aplicação em Flutter, abre um canal através do MethodChannel para se
comunicar com o host. Quando esse canal é criado, através dele podemos executar funções no lado nativo, e caso seja necessário podemos
receber uma resposta dos métodos que foram executados. Para fazer uma analogia, é semelhante a uma requisição GET que fazemos nas
APIs, onde podemos solicitar determinada operação e aguardar por um dado que será retornado e quando isso acontecer podemos manipula-lo
no dart da forma que bem entendermos.

<img title="a title" alt="Alt text" src="https://docs.flutter.dev/assets/images/docs/PlatformChannels.png">

## Prática

Este repositório possui duas branchs. Na main foi disponiblizado o código completo e a baseApp, possui um app base com as telas que vamos usar para este exemplo. Aqueles que quiserem podem utilizar a segunda branch e seguir o passo a passo dessse tutorial.

### Modificar o brilho da tela do sistema operacional

### Sensor de temperatura


