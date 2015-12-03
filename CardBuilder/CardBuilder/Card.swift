//
//  Card.swift
//  CardBuilder
//
//  Created by Conrad Stoll on 12/7/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

import Foundation
import UIKit

public class Card : NSObject {
    
    let view : UIView
    
    public func debugQuickLookObject() -> AnyObject? {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public var backgroundColor : Color = Color.LightGreen {
        didSet {
            addBackgroundColor(self.backgroundColor)
        }
    }
    
    public var greetingText : String = "" {
        didSet {
            addGreetingText(self.greetingText)
        }
    }
    
    public var messageText : String = "" {
        didSet {
            addMessageText(self.messageText)
        }
    }
    
    public var messageFont : Font = Font.MarkerFelt {
        didSet {
            changeMessageFont(self.messageFont)
        }
    }
    
    public var greetingFont : Font = Font.MarkerFelt {
        didSet {
            changeGreetingFont(self.greetingFont)
        }
    }
    
    
    public override init() {
        view = UIView(frame: CGRectMake(0, 0, 640, 480))
        
        Card.loadCustomFonts()
        
        greetingLabel = UILabel(frame: CGRectMake(0, 60, 640, 140))
        greetingLabel.backgroundColor = UIColor.clearColor()
        greetingLabel.font = UIFont(name: "MarkerFelt-Thin", size: 64)
        greetingLabel.textAlignment = NSTextAlignment.Center
        greetingLabel.numberOfLines = 0
        greetingLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        greetingLabel.clipsToBounds = false
        view.addSubview(greetingLabel)
        
        messageLabel = UILabel(frame: CGRectMake(0, 400, 640, 80))
        messageLabel.backgroundColor = UIColor.clearColor()
        messageLabel.font = UIFont(name: "MarkerFelt-Thin", size: 36)
        messageLabel.textAlignment = NSTextAlignment.Center
        view.addSubview(messageLabel)
        
        clipArtDictionary = [ClipArt : UIImageView]()
        imageCacheDictionary = [ClipArt : UIImage]()
    }
    
    public func addBackgroundColor(color : Color) {
        view.backgroundColor = Card.colorForColor(color)
    }
    
    public func addGreetingText(text : String) {
        greetingLabel.text = text
    }
    
    public func addMessageText(text : String) {
        messageLabel.text = text
    }
    
    public func addClipArtImage(image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let _ = existingView {
            
        } else {
            let newView = UIImageView(frame: frameForClipArt(image))
            newView.contentMode = UIViewContentMode.ScaleAspectFit
            newView.image = imageForClipArt(image)
            view.addSubview(newView)
            clipArtDictionary[image] = newView
        }
    }
    
    public func moveClipArtImageUp(image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let Y = theExistingView.frame.origin.y
            var newY = Y - 40
            
            if (newY < 0) {
                newY = 0
            }
            
            existingView?.frame.origin.y = newY
        }
    }
    
    public func moveClipArtImageDown(image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let Y = theExistingView.frame.origin.y
            var newY = Y + 40
            
            if (newY < 0) {
                newY = 0
            }
            
            existingView?.frame.origin.y = newY
        }
    }
    
    public func moveClipArtImageLeft(image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let X = theExistingView.frame.origin.x
            var newX = X - 40
            
            if (newX < 0) {
                newX = 0
            }
            
            existingView?.frame.origin.x = newX
        }
    }
    
    public func moveClipArtImageRight(image : ClipArt) {
        let existingView = clipArtDictionary[image]
        
        if let theExistingView = existingView {
            let X = theExistingView.frame.origin.x
            var newX = X + 40
            
            if (newX < 0) {
                newX = 0
            }
            
            existingView?.frame.origin.x = newX
        }
    }
    
    public func changeGreetingFont(font : Font) {
        greetingLabel.font = greetingFontForFont(font)
    }
    
    public func changeMessageFont(font : Font) {
        messageLabel.font = messageFontForFont(font)
    }
    
    
    
    
    
    private let greetingLabel : UILabel
    private let messageLabel : UILabel
    private var clipArtDictionary : [ClipArt : UIImageView]
    private var imageCacheDictionary : [ClipArt : UIImage]
    
    

    
    class func colorForColor(color : Color) -> UIColor {
        switch(color) {
        case .LightBlue:
            return UIColor(netHex:0xBDDEF5)
        case .LightGreen:
            return UIColor(netHex:0xABE29D)
        case .LightOrange:
            return UIColor(netHex:0xF4CF99)
        case .LightRed:
            return UIColor(netHex:0xFFA194)
        case .LightYellow:
            return UIColor(netHex: 0xF0F4A9)
        case .HollyGreen:
            return UIColor(netHex: 0x72b48f)
        case .SnowWhite:
            return UIColor(netHex: 0xf4f1e4)
        case .BlueSky:
            return UIColor(netHex: 0x80c6d7)
        }
    }
    
    private func imageForClipArt(clipArt : ClipArt) -> UIImage {
        if let image = imageCacheDictionary[clipArt] {
            return image
        }
        
        var imageName = "snowman"
        
        switch(clipArt) {
        case .Dradle:
            imageName = "dradle"
        case .Garland:
            imageName = "garland"
        case .Holly:
            imageName = "holly"
        case .Menorah:
            imageName = "menorah"
        case .Present:
            imageName = "present"
        case .Snowflake1:
            imageName = "snowflake1-a"
        case .Snowflake2:
            imageName = "snowflake2-a"
        case .Snowman:
            imageName = "snowman"
        case .Star:
            imageName = "star"
        case .Tree:
            imageName = "tree"
        }
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource(imageName, ofType: "png")
        let image = UIImage(contentsOfFile: path!)
        
        if let cacheImage = image {
            imageCacheDictionary[clipArt] = cacheImage
        }
        
        return image!
    }
    
    private func frameForClipArt(clipArt : ClipArt) -> CGRect {
        switch(clipArt) {
        case .Dradle:
            return CGRectMake(440, 320, 60, 90)
        case .Garland:
            return CGRectMake(0, -20, 640, 256)
        case .Holly:
            return CGRectMake(300, 340, 80, 60)
        case .Menorah:
            return CGRectMake(180, 240, 80, 80)
        case .Present:
            return CGRectMake(280, 180, 70, 80)
        case .Snowflake1:
            return CGRectMake(380, 240, 80, 80)
        case .Snowflake2:
            return CGRectMake(120, 160, 80, 80)
        case .Snowman:
            return CGRectMake(540, 360, 90, 120)
        case .Star:
            return CGRectMake(440, 120, 80, 80)
        case .Tree:
            return CGRectMake(60, 250, 120, 220)
        }
    }
    
    private func greetingFontForFont(font : Font) -> UIFont {
        switch(font) {
        case .AbrilFatFace:
            return UIFont(name: "Abril FatFace", size: 52)!
        case .Handlee:
            return UIFont(name: "Handlee-Regular", size: 64)!
        case .MarkerFelt:
            return UIFont(name: "MarkerFelt-Thin", size: 64)!
        case .Pacifico:
            return UIFont(name: "Pacifico", size: 48)!
        case .Satisfy:
            return UIFont(name: "Satisfy", size: 52)!
        case .Savoye:
            return UIFont(name: "SavoyeLetPlain", size: 96)!
        case .Zapfino:
            return UIFont(name: "Zapfino", size: 40)!
        }
    }
    
    private func messageFontForFont(font : Font) -> UIFont {
        switch(font) {
        case .AbrilFatFace:
            return UIFont(name: "Abril FatFace", size: 24)!
        case .Handlee:
            return UIFont(name: "Handlee-Regular", size: 32)!
        case .MarkerFelt:
            return UIFont(name: "MarkerFelt-Thin", size: 32)!
        case .Pacifico:
            return UIFont(name: "Pacifico", size: 32)!
        case .Satisfy:
            return UIFont(name: "Satisfy", size: 32)!
        case .Savoye:
            return UIFont(name: "SavoyeLetPlain", size: 48)!
        case .Zapfino:
            return UIFont(name: "Zapfino", size: 28)!
        }
    }
    
    private class func loadCustomFonts() {
        loadCustomFontWithName("AbrilFatFace")
        loadCustomFontWithName("Handlee")
        loadCustomFontWithName("Pacifico")
        loadCustomFontWithName("Satisfy")
    }
    
    private class func loadCustomFontWithName(name : String) {
        let bundle = NSBundle.mainBundle()

        let path = bundle.pathForResource(name, ofType: "ttf")
        
        if let fontPath = path {
            let data = NSData(contentsOfFile: fontPath)
            let providerRef = CGDataProviderCreateWithCFData(data)
            let font = CGFontCreateWithDataProvider(providerRef)
            CTFontManagerRegisterGraphicsFont(font!, nil)
        }
    }
}



