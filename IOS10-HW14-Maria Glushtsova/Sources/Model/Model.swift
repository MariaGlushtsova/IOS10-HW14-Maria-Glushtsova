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
}

extension Model {
    static let modelsArray = [
        [
            Model(image: "Camera", name: "Недавние", imageCount: ""),
            Model(image: "Favorite", name: "Избранные", imageCount: ""),
            Model(image: "Instagram", name: "Instagram", imageCount: ""),
            Model(image: "Pin", name: "Pinterest", imageCount: ""),
            Model(image: "Telegram", name: "Telegram", imageCount: ""),
            Model(image: "SriLanka", name: "Шри Ланка", imageCount: ""),
            Model(image: "Canaria", name: "Канария", imageCount: ""),
            Model(image: "Viber", name: "Viber", imageCount: "")
        ],
        [
            Model(image: "People", name: "Люди", imageCount: "4"),
            Model(image: "Maps", name: "Места", imageCount: "568")
        ],
        [
            Model(image: "video", name: "Видео", imageCount: "163"),
            Model(image: "person.crop.rectangle", name: "Селфи", imageCount: "62"),
            Model(image: "livephoto", name: "Фото Live Photos", imageCount: "53"),
            Model(image: "cube", name: "Портреты", imageCount: "58"),
            Model(image: "pano", name: "Панорамы", imageCount: "1"),
            Model(image: "camera.viewfinder", name: "Снимки Экрана", imageCount: "48"),
            Model(image: "record.circle", name: "Записи экрана", imageCount: "4"),
            Model(image: "square.stack.3d.forward.dottedline", name: "Анимированные", imageCount: "2")
        ],
        [
            Model(image: "square.and.arrow.down", name: "Импортированные", imageCount: "66"),
            Model(image: "rectangle.on.rectangle", name: "Дубликаты", imageCount: "2"),
            Model(image: "eye.slash", name: "Скрытые", imageCount: "lock.fill"),
            Model(image: "trash", name: "Недавно удаленные", imageCount: "lock.fill")
        ]
    ]
}
