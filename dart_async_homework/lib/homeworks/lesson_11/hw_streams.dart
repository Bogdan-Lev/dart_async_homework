// Частина 2: Streams
void main() async {
  await runTask6();
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
