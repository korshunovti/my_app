# Ani Rate

Веб-приложение для экспертной оценки аниме. Пользователи просматривают тайтлы по годам выхода, ставят оценки от 1 до 10 и собирают личную подборку избранного. На основе оценок всех пользователей формируется рейтинг: топ-10 за каждый год и топ-10 за всё время.

Учебный проект по дисциплине «Методики разработки веб-приложений (Ruby on Rails)», СПбПУ.

## Возможности

- Регистрация и вход с хешированием паролей через bcrypt
- Просмотр аниме по годам с листанием по кругу
- Оценка ползунком от 1 до 10 с шагом 0.1
- Избранное с отдельной страницей
- Рейтинг: топ-10 общий и по каждому году (в зачёт идут тайтлы с 3+ оценками)
- Профиль: смена имени, email и пароля с подтверждением текущего, удаление аккаунта
- Локализация: русский и английский, включая названия тайтлов
- JSON API для оценок, избранного и выборки по годам

## Технологии

| Слой | Что используется |
|---|---|
| Backend | Ruby on Rails 7.1, PostgreSQL |
| Frontend | Stimulus, Hotwire, importmap |
| Шаблоны | Haml |
| Стили | Sass, Bootstrap 5 |
| Аутентификация | has_secure_password (bcrypt), remember token в cookie |

## Требования

- Ruby 3.3.0
- PostgreSQL 14+
- Node.js (для работы importmap)

## Установка

**1. Клонировать репозиторий**

```bash
git clone https://github.com/korshunovti/my_app.git
cd my_app
```

**2. Установить зависимости**

```bash
bundle install
```

**3. Создать роль и базы данных**

```bash
sudo -u postgres createuser -P my_app
sudo -u postgres psql -c "ALTER ROLE my_app WITH CREATEDB CREATEROLE;"
sudo -u postgres createdb -O my_app my_app_development
sudo -u postgres createdb -O my_app my_app_test
```

**4. Настроить пароль базы**

Пароль хранится в зашифрованных credentials. Файл `config/master.key` не входит в репозиторий, поэтому credentials нужно создать заново:

```bash
rm config/credentials.yml.enc
EDITOR="nano" rails credentials:edit
```

В открывшемся редакторе добавить:

```yaml
database:
  password: пароль_роли_my_app
```

**5. Применить миграции и загрузить данные**

```bash
rails db:migrate
rails db:seed
```

**6. Запустить сервер**

```bash
rails server
```

Приложение доступно на `http://localhost:3000`.

## Тестовые аккаунты

После `rails db:seed` в базе создаются два пользователя:

| Email | Пароль |
|---|---|
| expert@anime.com | 222222 |
| qwerty@mail.ru | 222222 |

## Структура данных

- **User** — пользователь: имя, email, хеш пароля, токен сессии
- **Theme** — год выхода (2024, 2025, 2026)
- **AnimeTitle** — тайтл: название на двух языках, файл постера, средняя оценка, ссылка на год
- **Value** — оценка: пользователь, тайтл, значение (одна оценка на пару пользователь–тайтл)
- **Favorite** — избранное: пользователь, тайтл

## API

Все эндпоинты требуют авторизации.

| Метод | Путь | Назначение |
|---|---|---|
| GET | `/api/theme_titles?theme_id=N` | Список тайтлов года с оценками и признаком избранного |
| POST | `/api/values` | Сохранить оценку (`anime_title_id`, `value`) |
| POST | `/api/favorites` | Добавить или убрать из избранного (`anime_title_id`) |

## Изображения

Постеры лежат в `app/assets/images/pictures/` и подключаются через путь, добавленный в `config/initializers/assets.rb`. Имя файла хранится в поле `file` модели `AnimeTitle`.

## Локализация

Файлы переводов — `config/locales/ru.yml` и `en.yml`. Язык переключается в шапке, выбор сохраняется в сессии. Названия тайтлов и годов переводятся через поле `name_en` в базе и метод `display_name` в моделях.

## Автор

Коршунов Тимофей — [github.com/korshunovti](https://github.com/korshunovti)
