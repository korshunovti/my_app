Value.delete_all
AnimeTitle.delete_all
Theme.delete_all
User.delete_all

t2024 = Theme.create!(name: "2024")
t2025 = Theme.create!(name: "2025")
t2026 = Theme.create!(name: "2026")

AnimeTitle.create!([
                     {name: 'Дандадан', file: 'dandadan.jpg', theme_id: t2024.id},
                     {name: 'Поднятие уровня в одиночку', file: 'sololeveling.jpg', theme_id: t2024.id},
                     {name: 'Кайдзю № 8', file: 'Kaiju8.jpg', theme_id: t2024.id},
                     {name: 'Ветролом', file: 'WindBreaker.jpg', theme_id: t2024.id},
                     {name: 'Волшебница и злой офицер', file: 'Katsute Mahou Shoujo to Aku wa Tekitai shiteita.jpg', theme_id: t2024.id},
                     {name: 'Выходной господина Злодея', file: 'Kyuujitsu no Warumono-san.jpg', theme_id: t2024.id},
                     {name: 'Эльф не может похудеть', file: 'Эльф не может похудеть.jpg', theme_id: t2024.id},
                     {name: 'Парадоксальный навык "Мастер фруктов"', file: 'Парадоксальный навык.jpg', theme_id: t2024.id},
                     {name: 'Синяя тюрьма: Блю Лок — Эпизод Наги', file: 'Blue Lock Episode Nagi.jpg', theme_id: t2024.id},
                     {name: 'Атака Титанов: Последняя атака', file: 'The Last Attack.jpg', theme_id: t2024.id},
                     {name: 'Гачиакута', file: 'Gachiakuta.jpg', theme_id: t2025.id},
                     {name: 'Монолог фармацевта 2', file: 'Kusuriya no Hitorigoto.jpg', theme_id: t2025.id},
                     {name: 'Поднятие уровня в одиночку 2', file: 'Solo Leveling 2.jpg', theme_id: t2025.id},
                     {name: 'Дни Сакамото', file: 'Sakamoto Days.jpg', theme_id: t2025.id},
                     {name: 'Доктор Стоун 4', file: 'Dr. Stone.jpg', theme_id: t2025.id},
                     {name: 'Пламенная бригада пожарных 3', file: 'Enen no Shouboutai.jpg', theme_id: t2025.id},
                     {name: 'Благоухающий цветок расцветает', file: 'flowers.jpg', theme_id: t2025.id},
                     {name: 'Молчаливая ведьма', file: 'vedma.jpg', theme_id: t2025.id},
                     {name: 'Апокалипсис: Отель', file: 'hotel.jpg', theme_id: t2025.id},
                     {name: 'Первородный грех Такопи', file: 'Такопи.jpg', theme_id: t2025.id},
                     {name: 'Магическая битва 3', file: 'Магическая битва 3.jpg', theme_id: t2026.id},
                     {name: 'Адский рай 2', file: 'Jigokuraku 2nd Season.jpg', theme_id: t2026.id},
                     {name: 'Монолог фармацевта 3', file: 'Kusuriya no Hitorigoto 3rd Season.jpg', theme_id: t2026.id},
                     {name: 'Блич: Кровавая война', file: 'Bleach.jpg', theme_id: t2026.id},
                     {name: 'Мастера на все руки', file: 'Yuusha.jpg', theme_id: t2026.id},
                     {name: 'Ателье колдовских колпаков', file: 'Tongari Boushi no Atelier.jpg', theme_id: t2026.id},
                     {name: 'Тёмный демон', file: 'Tougen Anki.jpg', theme_id: t2026.id},
                     {name: 'Инцидент Дарвина', file: 'Darwin Jihen.jpg', theme_id: t2026.id},
                     {name: 'Призрак в доспехах', file: 'Призрак в доспехах.jpg', theme_id: t2026.id},
                     {name: 'Истинные чудотворные рыцари', file: 'Yoroi Shin Den Samurai Troopers.jpg', theme_id: t2026.id}
                   ])

User.create!(name: "Expert", email: "expert@anime.com")