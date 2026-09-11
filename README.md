# TaskFlow

A simple console-based Task Manager built with **Dart** as a practical project to apply core Dart programming and OOP concepts.

## Features

* Add tasks
* View all tasks
* Complete tasks
* Delete tasks
* Search tasks
* Filter tasks by status
* Sort tasks A → Z / Z → A
* Save tasks to JSON
* Load tasks from JSON
* Automatic task IDs
* Task creation date and time
* Custom exception handling

## Project Structure

```text
task_flow/
├── lib/
│   ├── enums/
│   │   └── status.dart
│   ├── models/
│   │   └── task.dart
│   ├── managers/
│   │   └── task_manager.dart
│   └── exceptions/
│       └── task_not_found_exception.dart
│
└── bin/
    └── main.dart
```

## Concepts Practiced

This project was built while learning Dart and covers concepts such as:

* Variables & Data Types
* Functions
* Collections
* Null Safety
* OOP
* Encapsulation
* Constructors & Named Constructors
* Factory Constructors
* Abstract Classes
* Inheritance
* Interfaces
* Mixins
* Enums
* Static Members
* Extensions
* Immutability
* Records & Patterns
* Generics
* Exception Handling
* DateTime
* Collection Methods
* File I/O
* JSON Serialization
* `Future`
* `async / await`

## Data Persistence

Tasks are stored locally in a JSON file:

```text
tasks.json
```

The application loads saved tasks when it starts and saves the current tasks when it exits.

## Running the Project

Make sure Dart SDK is installed, then run:

```bash
dart run
```

## Purpose

TaskFlow was created as a **hands-on Dart learning project** to move from learning individual language concepts to using them together in a small application.

This project marks the completion of the **Dart learning phase** before moving on to **Flutter**.

---

**Built with Dart 🐦**
