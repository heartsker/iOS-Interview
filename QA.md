# Подготовка к собеседованию

## Что такое typealias в Swift? Как его можно создать?

```swift
typealias WorkerName = [(Int, String): Array<(String, String)>]
let name: WorkerName = [:]

typealias ID = String
typealias Tag = String

let id: ID
let tag: Tag
```

## Каковы три основных типа коллекций в Swift?

1. Array
    - Упорядоченная коллекция
    - Есть дубликаты
    - Поиск и удаление - O(n), добавление в конец - O(1)
2. Set
    - Неупорядоченная коллекция
    - Нет дубликатов
    - Поиск, удаление и добавление - O(1)
    - HashTable
3. Dictionary
    - Коллекция пар ключ-значение
    - Неупорядоченная коллекция
    - Нет дубликатов ключей
    - Поиск, удаление и добавление - O(1)
    - HashTable

## Можно ли поменять местами две переменные без третьей переменной-помощника?

```swift
var a = 1
var b = 2

// tmp variable
t = a
a = b
b = t

// no tmp variable
a += b // a = 1 + 2 = 3
b = a - b // b = 3 - 2 = 1
a -= b // a = 3 - 1 = 2

// tuples
(a, b) = (b, a)

// swap
swap(&a, &b)
```

## В чем разница между структурами и классами?

1. Классы это ссылочные (reference type) типы, структуры - значимые (value type)
2. Структуры поддерживают автоматическое создание инициализаторов
3. Классы поддерживают наследование, а структуры - нет -> приведение типов
4. Можем менять константные сущности классов
    ```swift
    class A {
        var name: String
        // init
    }

    let a = A("Tony")

    a.name = "Stephen"
    ```

## Что такое опциональное связывание (optional binding) `?`

```swift
var strings: [String?]?
strings = ["hello"]
print(strings?.first?.count ?? 0) // 5 or 0
```

## Что такое Force Unwrapping (принудительное разворачивание)? Когда его следует использовать?

```swift
var number: Int? = nil
if number == nil {
    print ("error")
} else {
    let number2: Int = number!
}
```

## Что такое расширения?

```swift
class A {

}

// cannot add stored properties
extension A {
    let name = "Tony"
}

// can add computed properties
extension A {
    var name {
        "Tony"
    }
}

protocol Printable {
    func print()
}

extension Printable {
    func print() {
        print("Hello from Printable")
    }
}

class B: Printable {
    func print() {
        print("Hello from B")
    }
}

B().print() // prints "Hello from B"

extension B: CustomStringConvertible {
    var description: String {
        "This is B instance"
    }
}
// 0x76848489bcee08 class B
print(B()) // prints "This is B instance"
```

## Как запретить наследование класса?

```swift
class MayBeInherited {

}

class Subclass: MayBeInherited {

}

final class MayNotBeInherited {

}
```

## Можете ли вы устранить проблему в этом коде?
Приведенный ниже код выдает ошибку компилятора. Что не так? Как вы можете это исправить?

```swift
struct Apple {}

func pick(apple: Apple?) {
    guard let apple = apple else {
        print("No apple found!")
        return // no return is an error
    }   
    print(apple)
}
```

## Объясните архитектуру MVC

Model-View-Controller
- Model - отвечает за бизнес логика, тяжелые задачи, вычисления
- View - то, что видит пользователь
- Controller - связка View и Model, передает данные, простые задачи

Пример:

Модель - Данные пользователя, метод для загрузки изображения
Вью - Показывает имя пользователя и картинку с кнопкой
Контроллер - Изменять имя при нажатии, вызывать метод модели для загрузки при нажатии на кнопку