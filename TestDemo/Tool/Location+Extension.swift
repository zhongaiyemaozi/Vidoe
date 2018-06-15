//
//  CLLocation+Extension.swift
//  TestDemo
//
//  Created by fuyongYU on 2018/5/28.
//  Copyright © 2018年 YeMaoZi. All rights reserved.
//

import UIKit

extension CLLocationCoordinate2D {
    
    func transformFromEarthToMars() -> CLLocationCoordinate2D {
        
        if self.isOutChina() {
            return self
        }
        let a = 6378245.0
        let ee = 0.00669342162296594323
        
        var dLat = transformLatitudeFromEarthToMars()
        var dLon = transformLongitudeFromEarthToMars()
        let radLat = self.latitude / 180.0 * Double.pi;
        var magic = sin(radLat);
        magic = 1 - ee * magic * magic;
        let sqrtMagic = sqrt(magic);
        dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * Double.pi);
        dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * Double.pi);
        let latitude = self.latitude + dLat
        let longitude = self.longitude + dLon
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    private func transformLatitudeFromEarthToMars() -> Double {
        let x = self.longitude - 105
        let y = self.latitude - 35
        var ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x))
        ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
        ret += (20.0 * sin(y * Double.pi) + 40.0 * sin(y / 3.0 * Double.pi)) * 2.0 / 3.0
        ret += (160.0 * sin(y / 12.0 * Double.pi) + 320 * sin(y * Double.pi / 30.0)) * 2.0 / 3.0
        return ret
    }
    
    private func transformLongitudeFromEarthToMars() -> Double {
        let x = self.longitude - 105
        let y = self.latitude - 35
        var ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x))
        ret += (20.0 * sin(6.0 * x * Double.pi) + 20.0 * sin(2.0 * x * Double.pi)) * 2.0 / 3.0
        ret += (20.0 * sin(x * Double.pi) + 40.0 * sin(x / 3.0 * Double.pi)) * 2.0 / 3.0
        ret += (150.0 * sin(x / 12.0 * Double.pi) + 300.0 * sin(x / 30.0 * Double.pi)) * 2.0 / 3.0
        return ret
    }
    
    private func isOutChina() -> Bool {
        if self.longitude < 72.004 || self.longitude > 137.8347 {
            return true
        }
        if self.latitude < 0.8293 || self.latitude > 55.8271 {
            return true
        }
        return false
    }
    
}
