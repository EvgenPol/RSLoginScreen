# RSLoginScreen

Привет!
Я Евгений Полюбин и это моя реализация экрана RSLoginScreen.
Некоторые файлы были перекинуты в папку otherStuff ( там же асеты и лаунчскрин ). Так же все цвета и иконки были добавлены в асетс.
Верстка частично из кода, и частично в xib-e. Корректно отображается на iPhone 8.

**Username: username ** 
**Password: password**
**add. password: 132**

Для реализации были созданы две категории в отдельных файлах:

    1) "SetUp" для UIButton - Здесь происходит первоначальная настройка вида кнопок и изменение их при нажатии.
        Состояние disabled описано в xib.
        
    2)  "MyState" для UIView - Здесь объявлено перечисление для контроля состояний textField - ов (login и password) и поля secure. А так же здесь происходит изменение этих view при переходе на эти состояния.
    
++ Одна категория в конце VC для работы с клавиатурой.



В остальном старался называть функции и переменные понятными именами)

# Фотографии проекта
![FotoOne](https://user-images.githubusercontent.com/78258561/127765514-27c905f7-c7e0-4e95-8664-0bbb8ba77adf.png)
![FotoTwo](https://user-images.githubusercontent.com/78258561/127765522-2514c083-813a-4b54-a8f1-408b43508122.png)
![FotoThree](https://user-images.githubusercontent.com/78258561/127765524-d3c563d4-0f93-48a5-a774-6e6da020912b.png)


