# RSLoginScreen

Привет!
Я Евгений Полюбин и это моя реализация экрана RSLoginScreen.
Некоторые файлы были перекинуты в папку otherStuff ( там же асеты и лаунчскрин ). Так же все цвета и иконки были добавлены в асетс.
Верстка частично из кода, и частично в xib-e.

Для реализации были созданы две категории в отдельных файлах:

    1) "SetUp" для UIButton - Здесь происходит первоначальная настройка вида кнопок и изменение их при нажатии.
        Состояние disabled описано в xib.
        
    2)  "MyState" для UIView - Здесь объявлено перечисление для контроля состояний textField - ов (login и password) и поля secure. А так же здесь происходит изменение этих view при переходе на эти состояния.
    
++ Одна категория в конце VC для работы с клавиатурой.



В остальном старался называть функции и переменные понятными именами)
