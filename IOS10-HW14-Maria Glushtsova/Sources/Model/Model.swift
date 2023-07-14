//
//  Model.swift
//  IOS10-HW14-Maria Glushtsova
//
//  Created by Admin on 13.07.23.
//

import Foundation

struct Model: Hashable {
    let image: String
    let name: String
    let imageCount: String?
    let lockImage: String?
}

class DataManager {
    private init() {}
    
    static let shared = DataManager()
    
    func createModels() -> [[Model]] {
        return [
            [
                Model(image: "Camera", name: "Недавние", imageCount: "1390", lockImage: nil),
                Model(image: "Favorite", name: "Избранные", imageCount: "60", lockImage: nil),
                Model(image: "Instagram", name: "Instagram", imageCount: "14", lockImage: nil),
                Model(image: "Pin", name: "Pinterest", imageCount: "87", lockImage: nil),
                Model(image: "Telegram", name: "Telegram", imageCount: "653", lockImage: nil),
                Model(image: "SriLanka", name: "Шри Ланка", imageCount: "1005", lockImage: nil),
                Model(image: "Canaria", name: "Канария", imageCount: "503", lockImage: nil),
                Model(image: "Viber", name: "Viber", imageCount: "9", lockImage: nil)
            ],
            [
                Model(image: "People", name: "Люди", imageCount: "4", lockImage: nil),
                Model(image: "Maps", name: "Места", imageCount: "568", lockImage: nil)
            ],
            [
                Model(image: "video", name: "Видео", imageCount: "163", lockImage: nil),
                Model(image: "person.crop.rectangle", name: "Селфи", imageCount: "62", lockImage: nil),
                Model(image: "livephoto", name: "Фото Live Photos", imageCount: "53", lockImage: nil),
                Model(image: "cube", name: "Портреты", imageCount: "58", lockImage: nil),
                Model(image: "pano", name: "Панорамы", imageCount: "1", lockImage: nil),
                Model(image: "camera.viewfinder", name: "Снимки Экрана", imageCount: "48", lockImage: nil),
                Model(image: "record.circle", name: "Записи экрана", imageCount: "4", lockImage: nil),
                Model(image: "square.stack.3d.forward.dottedline", name: "Анимированные", imageCount: "2", lockImage: nil)
            ],
            [
                Model(image: "square.and.arrow.down", name: "Импортированные", imageCount: "66", lockImage: nil),
                Model(image: "rectangle.on.rectangle", name: "Дубликаты", imageCount: "2", lockImage: nil),
                Model(image: "eye.slash", name: "Скрытые", imageCount: nil, lockImage: "lock.fill"),
                Model(image: "trash", name: "Недавно удаленные", imageCount: nil, lockImage: "lock.fill")
            ]
        ]
    }
}
