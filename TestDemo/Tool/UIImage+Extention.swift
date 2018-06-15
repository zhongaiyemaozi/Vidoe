//
//  CLUIImage+Extention.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/28.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

extension UIImage {
    
    var opaque: Bool {
        get {
            let alphaInfo = cgImage?.alphaInfo
            let opaque = alphaInfo == .noneSkipLast ||
                alphaInfo == .noneSkipFirst ||
                alphaInfo == .none
            return opaque
        }
    }
    
    func resizeWidth(to width: CGFloat) -> UIImage? {
        let height = size.height * width / size.width
        return resize(to: CGSize(width: width, height: height))
    }
    
    func resizeHeight(to height: CGFloat) -> UIImage? {
        let width = size.width * height / size.height
        return resize(to: CGSize(width: width, height: height))
    }
    
    func resize(to maxWidthOrHeight: CGFloat) -> UIImage? {
        if maxWidthOrHeight < size.width && maxWidthOrHeight < size.height {
            return self
        } else if size.width > size.height {
            return resizeWidth(to: maxWidthOrHeight)
        } else if size.width < size.height {
            return resizeHeight(to: maxWidthOrHeight)
        } else {
            return resize(to: CGSize(width: maxWidthOrHeight, height: maxWidthOrHeight))
        }
    }
    
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func cropping(in rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale)
        draw(in: CGRect(x: -rect.origin.x, y: -rect.origin.y, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func jpegData(with compressionQuality: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, compressionQuality)
    }
    
    func pngData() -> Data? {
        return UIImagePNGRepresentation(self)
    }
    
    func image(withTintColor color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        context.clip(to: rect, mask: cgImage!)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func image(withBlendColor color: UIColor) -> UIImage? {
        guard let coloredImage = self.image(withTintColor: color) else {
            return nil
        }
        let filter = CIFilter(name: "CIColorBlendMode")
        filter?.setValue(ciImage, forKey: kCIInputBackgroundImageKey)
        filter?.setValue(CIImage(cgImage: coloredImage.cgImage!), forKey: kCIInputImageKey)
        guard let outputImage = filter?.outputImage else {
            return nil
        }
        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }
        let image = UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        return image
    }
}




