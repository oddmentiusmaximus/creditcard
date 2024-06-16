# CreditCard Application

This is a Flutter application that manages card transactions. The application is built with
Dart and uses the GetX state management solution for managing state. The application also includes
unit tests written with the `flutter_test` package.

## Project Structure

The project is structured as follows:

- `lib/`: This directory contains the main Dart code for the application.
- `test/`: This directory contains the unit tests for the application.
- `android/`: This directory contains the Android-specific code for the application.
- `ios/`: This directory contains the iOS-specific code for the application.

## Transaction Graph

The `TransactionGraph` which replicates a graph similar to GitHub's is located at `lib/src/transactions_view/view/widgets/transaction_graph.dart`.

## Project Organization

Each page in the application is broken down into the following components:

- `Binding`: This component is responsible for dependency injection.
- `Controller`: This component handles the business logic.
- `Model`: This component defines the data structure.
- `Repository`: This component manages data operations.
- `View`: This component handles the UI.

Additionally, global implementations are maintained separately in the `utils` directory.
## Key Files

- `lib/main.dart`: This is the entry point of the application.
- `test/controller_binding_test.dart`: This file contains unit tests for
  the `TransactionController`.
- `analysis_options.yaml`: This file configures the Dart analyzer, which statically analyzes Dart
  code to check for errors, warnings, and lints.

## Key Classes

- `TransactionController`: This class is responsible for managing the state of the transactions in
  the application. It is tested in `test/controller_binding_test.dart`.

## Running the Application

To run the application, you need to have Flutter and Dart installed on your machine. Once you have
these installed, you can run the application with the following command:

```bash
flutter run

## Testing the Application

```bash
flutter test

