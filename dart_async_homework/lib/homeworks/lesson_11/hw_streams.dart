import 'dart:async';

// Частина 2: Streams
void main() async {
  await runTask6();
  await runTask7();
  await runTask8();
}

// Task 6: Стрім з чисел (fromIterable)
// 1.Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
// 2.Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
// 3.Виведіть кожне значення з цього ж стріму, використовуючи метод listen.

Future<void> runTask6() async {
  print('------------------- Start_Task_6 -------------------');

  final numberStream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('Виведення за допомогою await for:');
  await for (final number in numberStream) {
    print('Число: $number');
  }

  final numberStream2 = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print('Виведення за допомогою listen:');
  await numberStream2
      .listen(
        (number) {
          print('Число: $number');
        },
        onDone: () {
          print('Прослуховування завершено');
        },
      )
      .asFuture();

  print('-------------------  End_Task_6  -------------------');
}

// Task 7: Зворотний відлік зі стріму (periodic)
// 1.Створіть Stream<int> за допомогою Stream.periodic, який генерує числа з затримкою в 1 секунду.
// 2.Обмежте відлік до 10 чисел за допомогою методу take.
// 3.Виведіть кожне число у консоль у форматі: "1...", "2...", "3...", ... "10...".

Future<void> runTask7() async {
  print('------------------- Start_Task_7 -------------------');

  final countdownStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (count) => count + 1,
  ).take(10);

  await for (final number in countdownStream) {
    print('$number...');
  }

  print('-------------------  End_Task_7  -------------------');
}

// Task 8: Робота з StreamController
// 1.Створіть StreamController<String>.
// 2.Додайте до цього контролера кілька довільних рядкових значень вручну (наприклад, "Hello", "World", "Dart").
// 3.Прослухайте цей стрім (через метод listen) і виведіть всі значення у консоль.
// 4.Закрийте контролер після додавання всіх значень.
// Використайте callback onDone у методі listen, щоб вивести повідомлення "Стрім завершено" після того, як стрім буде закритий.

Future<void> runTask8() async {
  print('------------------- Start_Task_8 -------------------');

  final controller = StreamController<String>();

  controller.add('Hello');
  controller.add('World');
  controller.add('Dart');

  controller.stream.listen(
    (value) {
      print('Отримано значення: $value');
    },
    onDone: () {
      print('Стрім завершено');
    },
  );

  await controller.close();

  print('-------------------  End_Task_8  -------------------');
}
