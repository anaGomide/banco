# Banco

Banco é uma aplicação Flutter que oferece funcionalidades bancárias. Esta aplicação é compatível com várias plataformas, incluindo Android, iOS, Linux, Windows e macOS.

## Funcionalidades

- Criação de contas bancárias
- Transferências entre contas
- Consulta de saldo
- Histórico de transações

## Estrutura do Projeto

- `lib/`: Contém o código fonte principal da aplicação em Flutter.
- `android/`: Contém os arquivos específicos para a plataforma Android.
- `ios/`: Contém os arquivos específicos para a plataforma iOS.
- `linux/`: Contém os arquivos específicos para a plataforma Linux.
- `macos/`: Contém os arquivos específicos para a plataforma macOS.
- `windows/`: Contém os arquivos específicos para a plataforma Windows.
- `test/`: Contém os testes unitários da aplicação.
- `build/`: Contém os arquivos gerados durante o processo de build.

## Configuração do Ambiente

### Pré-requisitos

- Flutter SDK: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio (para desenvolvimento Android)
- Xcode (para desenvolvimento iOS)
- CMake (para desenvolvimento Linux)

### Instalação

1. Clone o repositório:
    ```sh
    git clone https://github.com/anaGomide/banco
    cd banco
    ```

2. Instale as dependências:
    ```sh
    flutter pub get
    ```

3. Execute a aplicação:
    ```sh
    flutter run
    ```

## Build

Para gerar os builds para diferentes plataformas, utilize os seguintes comandos:

- Android:
    ```sh
    flutter build apk
    ```

- iOS:
    ```sh
    flutter build ios
    ```

- Linux:
    ```sh
    flutter build linux
    ```

- macOS:
    ```sh
    flutter build macos
    ```

- Windows:
    ```sh
    flutter build windows
    ```

## Arquitetura Utilizada

A aplicação utiliza a arquitetura MVVM (Model-View-ViewModel) para separar as responsabilidades e facilitar a manutenção do código. A estrutura do projeto é organizada da seguinte forma:

- **Model**: Representa os dados e a lógica de negócios da aplicação.
- **View**: Responsável pela interface do usuário e pela exibição dos dados.
- **ViewModel**: Atua como intermediário entre o Model e a View, gerenciando a lógica de apresentação e a comunicação entre a View e o Model.