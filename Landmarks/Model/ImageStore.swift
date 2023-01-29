//
//  ImageStore.swift
//  Landmarks
//
//  Created by Yoshiyasu KO on 2023/01/30.
//

import UIKit
import SwiftUI

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    static func loadImage(name: String) -> CGImage {
        guard let url = Bundle.main.url(forResource: "Images/\(name)", withExtension: "jpg"),
              let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
              let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        return Image(
            images.values[index],
            scale: CGFloat(ImageStore.scale),
            label: Text(name)
        )
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) {
            return index
        }
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
