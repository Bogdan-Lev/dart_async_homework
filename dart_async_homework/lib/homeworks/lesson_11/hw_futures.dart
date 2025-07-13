// Task 1: Асинхронне отримання імені
// 1.Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// 2.Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// 3.Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".
void main() async {
  await runTask1();
}

Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Bogdan';
}

Future<void> runTask1() async {
  print('------------------- Start_Task_1 -------------------');

  final name = await fetchName();
  print("My name $name");
  print('-------------------  End_Task_1  -------------------');
}
