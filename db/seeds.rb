Value.delete_all
AnimeTitle.delete_all
Theme.delete_all
User.delete_all

t2024 = Theme.create!(name: "2024", name_en: "2024")
t2025 = Theme.create!(name: "2025", name_en: "2025")
t2026 = Theme.create!(name: "2026", name_en: "2026")

AnimeTitle.create!([
                     { name: 'Дандадан',
                       name_en: 'Dandadan',
                       file: 'dandadan.jpg', theme_id: t2024.id },

                     { name: 'Поднятие уровня в одиночку',
                       name_en: 'Solo Leveling',
                       file: 'sololeveling.jpg', theme_id: t2024.id },

                     { name: 'Кайдзю № 8',
                       name_en: 'Kaiju No. 8',
                       file: 'Kaiju8.jpg', theme_id: t2024.id },

                     { name: 'Ветролом',
                       name_en: 'Wind Breaker',
                       file: 'WindBreaker.jpg', theme_id: t2024.id },

                     { name: 'Волшебница и злой офицер',
                       name_en: 'The Magical Girl and the Evil Lieutenant Used to Be Archenemies',
                       file: 'Katsute Mahou Shoujo to Aku wa Tekitai shiteita.jpg', theme_id: t2024.id },

                     { name: 'Выходной господина Злодея',
                       name_en: "Mr. Villain's Day Off",
                       file: 'Kyuujitsu no Warumono-san.jpg', theme_id: t2024.id },

                     { name: 'Эльф не может похудеть',
                       name_en: 'Plus-Sized Elf',
                       file: 'Эльф не может похудеть.jpg', theme_id: t2024.id },

                     { name: 'Парадоксальный навык "Мастер фруктов"',
                       name_en: 'The Weakest Tamer Began a Journey to Pick Up Trash',
                       file: 'Парадоксальный навык.jpg', theme_id: t2024.id },

                     { name: 'Синяя тюрьма: Блю Лок — Эпизод Наги',
                       name_en: 'Blue Lock: Episode Nagi',
                       file: 'Blue Lock Episode Nagi.jpg', theme_id: t2024.id },

                     { name: 'Атака Титанов: Последняя атака',
                       name_en: 'Attack on Titan: The Last Attack',
                       file: 'The Last Attack.jpg', theme_id: t2024.id },

                     { name: 'Гачиакута',
                       name_en: 'Gachiakuta',
                       file: 'Gachiakuta.jpg', theme_id: t2025.id },

                     { name: 'Монолог фармацевта 2',
                       name_en: 'The Apothecary Diaries Season 2',
                       file: 'Kusuriya no Hitorigoto.jpg', theme_id: t2025.id },

                     { name: 'Поднятие уровня в одиночку 2',
                       name_en: 'Solo Leveling Season 2',
                       file: 'Solo Leveling 2.jpg', theme_id: t2025.id },

                     { name: 'Дни Сакамото',
                       name_en: 'Sakamoto Days',
                       file: 'Sakamoto Days.jpg', theme_id: t2025.id },

                     { name: 'Доктор Стоун 4',
                       name_en: 'Dr. Stone Season 4',
                       file: 'Dr. Stone.jpg', theme_id: t2025.id },

                     { name: 'Пламенная бригада пожарных 3',
                       name_en: 'Fire Force Season 3',
                       file: 'Enen no Shouboutai.jpg', theme_id: t2025.id },

                     { name: 'Благоухающий цветок расцветает',
                       name_en: 'The Fragrant Flower Blooms with Dignity',
                       file: 'flowers.jpg', theme_id: t2025.id },

                     { name: 'Молчаливая ведьма',
                       name_en: 'Secrets of the Silent Witch',
                       file: 'vedma.jpg', theme_id: t2025.id },

                     { name: 'Апокалипсис: Отель',
                       name_en: 'Apocalypse Hotel',
                       file: 'hotel.jpg', theme_id: t2025.id },

                     { name: 'Первородный грех Такопи',
                       name_en: "Takopi's Original Sin",
                       file: 'Такопи.jpg', theme_id: t2025.id },

                     { name: 'Магическая битва 3',
                       name_en: 'Jujutsu Kaisen Season 3',
                       file: 'Магическая битва 3.jpg', theme_id: t2026.id },

                     { name: 'Адский рай 2',
                       name_en: 'Hell\'s Paradise Season 2',
                       file: 'Jigokuraku 2nd Season.jpg', theme_id: t2026.id },

                     { name: 'Монолог фармацевта 3',
                       name_en: 'The Apothecary Diaries Season 3',
                       file: 'Kusuriya no Hitorigoto 3rd Season.jpg', theme_id: t2026.id },

                     { name: 'Блич: Кровавая война',
                       name_en: 'Bleach: Thousand-Year Blood War',
                       file: 'Bleach.jpg', theme_id: t2026.id },

                     { name: 'Мастера на все руки',
                       name_en: 'The Hero Party Handyman',
                       file: 'Yuusha.jpg', theme_id: t2026.id },

                     { name: 'Ателье колдовских колпаков',
                       name_en: 'Witch Hat Atelier',
                       file: 'Tongari Boushi no Atelier.jpg', theme_id: t2026.id },

                     { name: 'Тёмный демон',
                       name_en: 'Tougen Anki',
                       file: 'Tougen Anki.jpg', theme_id: t2026.id },

                     { name: 'Инцидент Дарвина',
                       name_en: 'Darwin\'s Incident',
                       file: 'Darwin Jihen.jpg', theme_id: t2026.id },

                     { name: 'Призрак в доспехах',
                       name_en: 'Ghost in the Shell',
                       file: 'Призрак в доспехах.jpg', theme_id: t2026.id },

                     { name: 'Истинные чудотворные рыцари',
                       name_en: 'Yoroiden Samurai Troopers',
                       file: 'Yoroi Shin Den Samurai Troopers.jpg', theme_id: t2026.id }
                   ])

User.create!([
               { name: "Expert", email: "expert@anime.com",
                 password: "222222", password_confirmation: "222222" },
               { name: "Tim", email: "qwerty@mail.ru",
                 password: "222222", password_confirmation: "222222" }
             ])

puts "Создано: #{Theme.count} тем, #{AnimeTitle.count} тайтлов, #{User.count} пользователей"