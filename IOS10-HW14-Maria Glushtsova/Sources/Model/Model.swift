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
    let imageCount: String?
    let lockImage: String?
    var handler: (() -> Void)
}

class DataManager {
    private init() {}
    
    static let shared = DataManager()
    
    func createModels() -> [[Model]] {
        return [
            [
                Model(image: "Camera", name: "Недавние", imageCount: "1390", lockImage: nil, handler: { print( "did tappped Недавние") }),
                Model(image: "Favorite", name: "Избранные", imageCount: "60", lockImage: nil, handler: { print( "did tappped Избранные" ) }),
                Model(image: "Instagram", name: "Instagram", imageCount: "14", lockImage: nil, handler: { print( "did tappped Instagram" ) }),
                Model(image: "Pin", name: "Pinterest", imageCount: "87", lockImage: nil, handler: { print( "did tappped Pinterest" ) }),
                Model(image: "Telegram", name: "Telegram", imageCount: "653", lockImage: nil, handler: { print( "did tappped Telegram" ) }),
                Model(image: "SriLanka", name: "Шри Ланка", imageCount: "1005", lockImage: nil, handler: { print( "did tappped Шри Ланка" ) }),
                Model(image: "Canaria", name: "Канария", imageCount: "503", lockImage: nil, handler: { print( "did tappped Канария" ) }),
                Model(image: "Viber", name: "Viber", imageCount: "9", lockImage: nil, handler: { print( "did tappped Viber" ) })
            ],
            [
                Model(image: "People", name: "Люди", imageCount: "4", lockImage: nil, handler: { print( "did tappped Люди" ) }),
                Model(image: "Maps", name: "Места", imageCount: "568", lockImage: nil, handler: { print( "did tappped Места" ) })
            ],
            [
                Model(image: "video", name: "Видео", imageCount: "163", lockImage: nil, handler: { print( "did tappped Видео" ) }),
                Model(image: "person.crop.rectangle", name: "Селфи", imageCount: "62", lockImage: nil, handler: { print( "did tappped Селфи" ) }),
                Model(image: "livephoto", name: "Фото Live Photos", imageCount: "53", lockImage: nil, handler: { print( "did tappped Фото Live Photos" ) }),
                Model(image: "cube", name: "Портреты", imageCount: "58", lockImage: nil, handler: { print( "did tappped Портреты" ) }),
                Model(image: "pano", name: "Панорамы", imageCount: "1", lockImage: nil, handler: { print( "did tappped Панорамы" ) }),
                Model(image: "camera.viewfinder", name: "Снимки Экрана", imageCount: "48", lockImage: nil, handler: { print( "did tappped Снимки Экрана" ) }),
                Model(image: "record.circle", name: "Записи экрана", imageCount: "4", lockImage: nil, handler: { print( "did tappped Записи экрана" ) }),
                Model(image: "square.stack.3d.forward.dottedline", name: "Анимированные", imageCount: "2", lockImage: nil, handler: { print( "did tappped Анимированные" ) })
            ],
            [
                Model(image: "square.and.arrow.down", name: "Импортированные", imageCount: "66", lockImage: nil, handler: { print( "did tappped Импортированные" ) }),
                Model(image: "rectangle.on.rectangle", name: "Дубликаты", imageCount: "2", lockImage: nil, handler: { print( "did tappped Дубликаты" ) }),
                Model(image: "eye.slash", name: "Скрытые", imageCount: nil, lockImage: "lock.fill", handler: { print( "did tappped Скрытые" ) }),
                Model(image: "trash", name: "Недавно удаленные", imageCount: nil, lockImage: "lock.fill", handler: { print( "did tappped Недавно удаленные" ) })
            ]
        ]
    }
}
