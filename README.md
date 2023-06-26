

## О NitroHealth
**NitroHealth** is a powerful web application designed to help people track their daily nutritional intake. By calculating the proteins, fats, carbohydrates, as well as the chemical and vitamin composition of a menu, NitroHealth provides users with a comprehensive breakdown of their daily diet.

With NitroHealth, users can easily create dishes or select from a pre-existing list of meals to add to their daily diet. Once added, NitroHealth automatically calculates the nutritional content of each meal, providing users with a detailed report on the chemical and energy composition of their menu.

This app is a truncated version of a more comprehensive program for calculating menus and other indicators, developed by the same creator. NitroHealth offers a simplified and user-friendly interface, making it easy for anyone to track their nutritional intake and make informed decisions about their diet.

Overall, NitroHealth is an excellent tool for those who are looking to take control of their nutritional intake and make healthier choices. With its comprehensive nutritional analysis and user-friendly interface, NitroHealth is the perfect app for anyone looking to lead a healthier lifestyle.

## Скрины
![image](https://user-images.githubusercontent.com/55738777/185775878-1034a870-6f54-4910-b51e-bb32a874cc43.png)
<p align="center"><small>Скрин 1</small></p>
На первом скриншоте представлен раздел с перечнем продуктов. Продукт можно удалить, если он не используется в блюде.

![image](https://user-images.githubusercontent.com/55738777/185775904-7d36d4c4-670e-4bd6-a88f-85a7cbabdeeb.png)
<p class="text-center" style="margin: 0 auto;"><small>Скрин 2</small></p>
Форма создания с валидацией (vuelidate).

![image](https://user-images.githubusercontent.com/55738777/185775928-1e07e6ae-448c-45ad-8411-ddbcd24771e6.png)
<p class="text-center" style="margin: 0 auto;"><small>Скрин 3</small></p>
Раздел с перечнем блюд.

![image](https://user-images.githubusercontent.com/55738777/185775957-3b670e1a-8bd2-45e8-a378-729990fa53b3.png)
<p class="text-center" style="margin: 0 auto;"><small>Скрин 4</small></p>
Добавления блюда.

![image](https://user-images.githubusercontent.com/55738777/185775975-c584c983-2695-4a62-af0a-d4e1907ba343.png)
<p class="text-center" style="margin: 0 auto;"><small>Скрин 5</small></p>
Список меню.

![image](https://user-images.githubusercontent.com/55738777/185775992-f1c1df81-5cee-455e-8169-862f767927ac.png)
<p class="text-center" style="margin: 0 auto;"><small>Скрин 6</small></p>
Работа с меню.

![image](https://user-images.githubusercontent.com/55738777/185776019-17c48776-6d75-4cbc-9076-4a15271dc8bd.png)

<p class="text-center" style="margin: 0 auto;"><small>Скрин 7</small></p>
Отчет по меню. По введенным данным формируется отчет.

## Технологии и инструменты
### Backend

- Laravel.
- PHP 7.4.
- MySQL.
- REST API.
- Виртуализация Docker.

### Frontend

- VUE.
- Bootstrap 4.
- JavaScript(Jquery)
- Html/css.

## Для установки
- git clone https://github.com/rsbrodov/laravel-vue-nutrition.git
- composer update
- npm install
- .env файл поправить под себя
- Базу данных рекомендую брать из корня проекта, так как для работы проекта нужно большое количество данных о продуктах. Или можно выполнить php artisan migrate
- php artisan serve
- npm run watch
- Логин: adminlaravel@mail.ru, Пароль: ******

Либо:
- sudo docker-compose up -d
- npm install
- npm run watch
