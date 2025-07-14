void main() async {
  await runTask1();
  await runTask2();
  await runTask3();
  await runTask4();
  await runTask5();
}

// Task 1: Асинхронне отримання імені
// 1.Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// 2.Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// 3.Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".

Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Богдан';
}

Future<void> runTask1() async {
  print('------------------- Start_Task_1 -------------------');

  final name = await fetchName();
  print('Мене звати $name');
  print('-------------------  End_Task_1  -------------------');
}

// Task 2: Асинхронне отримання віку
// 1.Створіть метод Future<String> fetchAge(), який імітує асинхронну операцію.
// 2.Цей метод повинен повертати рядок "25" через 1500 мілісекунд.
// 3.Виведіть результат у консоль у форматі: "Мені [ваш вік] років".
// 4.Реалізуйте логіку, щоб слово "рік" змінювалося відповідно до значення віку (наприклад: 21 рік, 22 роки, 25 років).

Future<String> fetchAge() async {
  await Future.delayed(Duration(milliseconds: 1500));
  return '25';
}

String getYearWord(int age) {
  final lastTwoDigits = age % 100;
  final lastDigit = age % 10;

  if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
    return 'років';
  }

  switch (lastDigit) {
    case 1:
      return 'рік';
    case 2:
    case 3:
    case 4:
      return 'роки';
    default:
      return 'років';
  }
}

Future<void> runTask2() async {
  print('------------------- Start_Task_2 -------------------');

  final age = await fetchAge();
  final ageInt = int.parse(age);
  final yearWord = getYearWord(ageInt);
  print('Мені $ageInt $yearWord');

  print('-------------------  End_Task_2  -------------------');
}

// Task 3: Послідовне виконання Future
// 1.Виконайте методи fetchName() та fetchAge() послідовно.
// 2.Виміряйте та виведіть час виконання обох методів.
// Порада. Можете використати для виконання другого пункту клас https://api.flutter.dev/flutter/dart-core/Stopwatch-class.html

Future<void> runTask3() async {
  print('------------------- Start_Task_3 -------------------');

  final stopwatch = Stopwatch()..start();

  final name = await fetchName();
  print('Мене звати $name');

  final age = await fetchAge();
  final ageInt = int.parse(age);
  final yearWord = getYearWord(ageInt);
  print('Мені $ageInt $yearWord');

  stopwatch.stop();
  print('Час виконання: ${stopwatch.elapsedMilliseconds} мс');

  print('-------------------  End_Task_3  -------------------');
}

// Task 4: Паралельне виконання Future (Future.wait)
// 1.Виконайте методи fetchName() та fetchAge() паралельно за допомогою Future.wait.
// 2.Виміряйте та виведіть час виконання.

Future<void> runTask4() async {
  print('------------------- Start_Task_4 -------------------');

  final stopwatch = Stopwatch()..start();

  final results = await Future.wait([fetchName(), fetchAge()]);
  final name = results[0];
  final age = results[1];
  final ageInt = int.parse(age);
  final yearWord = getYearWord(ageInt);

  print('Мене звати $name');
  print('Мені $ageInt $yearWord');

  stopwatch.stop();
  print('Час виконання: ${stopwatch.elapsedMilliseconds} мс');

  print('-------------------  End_Task_4  -------------------');
}

// Task 5: Зворотний відлік з затримкою
// 1.Напишіть функцію Future<String> delayedCountdown(int seconds), яка приймає кількість секунд.
// 2.Ця функція повинна щосекунди виводити у консоль відлік (наприклад: "3...", "2...", "1...").
// 3.В кінці відліку метод має повертати рядок "Старт!".

Future<String> delayedCountdown(int seconds) async {
  for (int i = seconds; i > 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    print('$i...');
  }
  return 'Старт!';
}

Future<void> runTask5() async {
  print('------------------- Start_Task_5 -------------------');

  final result = await delayedCountdown(3);
  print(result);

  print('-------------------  End_Task_5  -------------------');
}
