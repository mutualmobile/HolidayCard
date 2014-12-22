//
//  CardBuilder.swift
//  CardBuilder
//
//  Created by Conrad Stoll on 12/7/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

public func printCard(card : Card) -> UIImage {
    
    var pdfData = NSMutableData()
    
    UIGraphicsBeginPDFContextToData(pdfData, CGRectMake(0, 0, 640, 960), nil);
    UIGraphicsBeginPDFPage();
    
    var pdfContext = UIGraphicsGetCurrentContext()
    
    var pageView = UIView(frame: CGRectMake(0, 0, 640, 960))
    card.view.frame.origin.y = 480
    pageView.addSubview(card.view)
    
    pageView.layer.renderInContext(pdfContext)
    
    UIGraphicsEndPDFContext();
    
    
    var documentDirectories = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
    var documentDirectory: AnyObject? = documentDirectories.first

    var documentDirectoryFilename = documentDirectory?.stringByAppendingPathComponent("HolidayCard.pdf")
    
    pdfData.writeToFile(documentDirectoryFilename!, atomically: true)
    
    
    UIGraphicsBeginImageContext(card.view.bounds.size)
    card.view.layer.renderInContext(UIGraphicsGetCurrentContext())
    var image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
}

public func printDocumentsDirectory() -> NSString {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
    
    return documentsPath
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}