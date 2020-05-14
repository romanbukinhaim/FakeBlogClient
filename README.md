# FakeBlogClient
![aa](images/sample.gif)

#InheritedWidget
#Repository
#Clean Architecture

Приложение имитирующее некоторый блог.

## Принцип работы
Источник данных [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com)

Все данные сохраняются в логальную базу [sqflite](https://pub.dev/packages/sqflite). В дальнейшем, при недоступности онлайн-источника, подтягивет данные из базы, если они есть. Таким образом реализуется примитивное [PWA](https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B5%D1%81%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%D0%B5_%D0%B2%D0%B5%D0%B1-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5)
