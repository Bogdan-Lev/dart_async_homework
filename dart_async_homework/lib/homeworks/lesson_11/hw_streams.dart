// Частина 2: Streams
void main() async {
  await runTask6();
  await runTask7();
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
