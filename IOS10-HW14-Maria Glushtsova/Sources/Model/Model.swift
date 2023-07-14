//
//  Model.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import Foundation

struct Model {
    let image: String
    let name: String
    let imageCount: String
    let chevron: String?
}

extension Model {
    static let modelsArray = [
        [
            Model(image: "Camera", name: "Недавние", imageCount: "", chevron: nil),
            Model(image: "Favorite", name: "Избранные", imageCount: "", chevron: nil),
            Model(image: "Instagram", name: "Instagram", imageCount: "", chevron: nil),
            Model(image: "Pin", name: "Pinterest", imageCount: "", chevron: nil),
            Model(image: "Telegram", name: "Telegram", imageCount: "", chevron: nil),
            Model(image: "SriLanka", name: "Шри Ланка", imageCount: "", chevron: nil),
            Model(image: "Canaria", name: "Канария", imageCount: "", chevron: nil),
            Model(image: "Viber", name: "Viber", imageCount: "", chevron: nil)
        ],
        [
            Model(image: "People", name: "Люди", imageCount: "4", chevron: nil),
            Model(image: "Maps", name: "Места", imageCount: "568", chevron: nil)
        ],
        [
            Model(image: "video", name: "Видео", imageCount: "163", chevron: "chevron.right"),
            Model(image: "person.crop.rectangle", name: "Селфи", imageCount: "62", chevron: "chevron.right"),
            Model(image: "livephoto", name: "Фото Live Photos", imageCount: "53", chevron: "chevron.right"),
            Model(image: "cube", name: "Портреты", imageCount: "58", chevron: "chevron.right"),
            Model(image: "pano", name: "Панорамы", imageCount: "1", chevron: "chevron.right"),
            Model(image: "camera.viewfinder", name: "Снимки Экрана", imageCount: "48", chevron: "chevron.right"),
            Model(image: "record.circle", name: "Записи экрана", imageCount: "4", chevron: "chevron.right"),
            Model(image: "square.stack.3d.forward.dottedline", name: "Анимированные", imageCount: "2", chevron: "chevron.right")
        ],
        [
            Model(image: "square.and.arrow.down", name: "Импортированные", imageCount: "66", chevron: "chevron.right"),
            Model(image: "rectangle.on.rectangle", name: "Дубликаты", imageCount: "2", chevron: "chevron.right"),
            Model(image: "eye.slash", name: "Скрытые", imageCount: "lock.fill", chevron: "chevron.right"),
            Model(image: "trash", name: "Недавно удаленные", imageCount: "lock.fill", chevron: "chevron.right")
        ]
    ]
}
