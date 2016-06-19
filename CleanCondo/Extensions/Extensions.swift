//
//  Extensions.swift
//  OneSwiftPay
//
//  Created by --=_t0tep_=-- on 09/10/2015.
//  Copyright © 2015 OneNetworkEcommerce. All rights reserved.
//

import UIKit
import ImageIO

extension UIColor {
    convenience init(hex: Int) {
        let r = hex / 0x10000
        let g = (hex - r*0x10000) / 0x100
        let b = hex - r*0x10000 - g*0x100
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension String  {
    var md5: String! {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>(allocatingCapacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocateCapacity(digestLen)
        return String(format: hash as String)
    }
}

extension String {
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(data.base64EncodedString(), CC_LONG(data.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
}

extension Array {
    mutating func removeObject<U: Equatable>(_ object: U) -> Bool {
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    self.remove(at: idx)
                    return true
                }
            }
        }
        return false
    }
}

extension String {
    func replace(_ target: String, withString: String) -> String
    {
        
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literalSearch, range: nil)
    }
}

extension NSMutableData {
    
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

extension UITextView {
    func increaseFontSize() {
        self.font =  UIFont(name: self.font!.fontName, size: self.font!.pointSize+1)!
    }
}


extension UIImage {
    var uncompressedPNGData: Data      { return UIImagePNGRepresentation(self)!        }
    var highestQualityJPEGNSData: Data { return UIImageJPEGRepresentation(self, 1.0)!  }
    var highQualityJPEGNSData: Data    { return UIImageJPEGRepresentation(self, 0.75)! }
    var mediumQualityJPEGNSData: Data  { return UIImageJPEGRepresentation(self, 0.5)!  }
    var lowQualityJPEGNSData: Data     { return UIImageJPEGRepresentation(self, 0.25)! }
    var lowestQualityJPEGNSData:Data   { return UIImageJPEGRepresentation(self, 0.0)!  }
}



//extension UIImage {
//    
//    public class func gifWithData(_ data: Data) -> UIImage? {
//        guard let source = CGImageSourceCreateWithData(data, nil) else {
//            print("SwiftGif: Source for the image does not exist")
//            return nil
//        }
//        return UIImage.animatedImageWithSource(source)
//    }
//    
//    public class func gifWithName(_ name: String) -> UIImage? {
//        guard let bundleURL = Bundle.main().urlForResource(name, withExtension: "gif") else {
//            print("SwiftGif: This image named \"\(name)\" does not exist")
//            return nil
//        }
////        guard let imageData = Data(contentsOfURL: bundleURL) else {
////            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
////            return nil
////        }
//        
//        guard let imageData = Data(contentsOfURL: bundleURL) else {
//            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
//            return nil
//        }
//        
//        
//        return gifWithData(data: imageData)
//    }
//    
//    class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
//        var delay = 0.1
//        
//        // Get dictionaries
//        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
//        let gifProperties: CFDictionary = unsafeBitCast(
//            CFDictionaryGetValue(cfProperties,
//                unsafeAddress(of: kCGImagePropertyGIFDictionary)),
//            to: CFDictionary.self)
//        
//        // Get delay time
//        var delayObject: AnyObject = unsafeBitCast(
//            CFDictionaryGetValue(gifProperties,
//                unsafeAddress(of: kCGImagePropertyGIFUnclampedDelayTime)),
//            to: AnyObject.self)
//        if delayObject.doubleValue == 0 {
//            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
//                unsafeAddress(of: kCGImagePropertyGIFDelayTime)), to: AnyObject.self)
//        }
//        
//        delay = delayObject as! Double
//        
//        if delay < 0.1 {
//            delay = 0.1 // Make sure they're not too fast
//        }
//        
//        return delay
//    }
//    
//    class func gcdForPair( _ a: Int?, _ b: Int?) -> Int {
//        // Check if one of them is nil
//        var b = b
//        var a = a
//        if b == nil || a == nil {
//            if b != nil {
//                return b!
//            } else if a != nil {
//                return a!
//            } else {
//                return 0
//            }
//        }
//        
//        // Swap for modulo
//        if a < b {
//            let c = a
//            a = b
//            b = c
//        }
//        
//        // Get greatest common divisor
//        var rest: Int
//        while true {
//            rest = a! % b!
//            
//            if rest == 0 {
//                return b! // Found it
//            } else {
//                a = b
//                b = rest
//            }
//        }
//    }
//    
//    class func gcdForArray(_ array: Array<Int>) -> Int {
//        if array.isEmpty {
//            return 1
//        }
//        
//        var gcd = array[0]
//        
//        for val in array {
//            gcd = UIImage.gcdForPair(val, gcd)
//        }
//        
//        return gcd
//    }
//    
//    class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
//        let count = CGImageSourceGetCount(source)
//        var images = [CGImage]()
//        var delays = [Int]()
//        
//        // Fill arrays
//        for i in 0..<count {
//            // Add image
//            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
//                images.append(image)
//            }
//            
//            // At it's delay in cs
//            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
//                source: source)
//            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
//        }
//        
//        // Calculate full duration
//        let duration: Int = {
//            var sum = 0
//            
//            for val: Int in delays {
//                sum += val
//            }
//            
//            return sum
//        }()
//        
//        // Get frames
//        let gcd = gcdForArray(delays)
//        var frames = [UIImage]()
//        
//        var frame: UIImage
//        var frameCount: Int
//        for i in 0..<count {
//            frame = UIImage(cgImage: images[Int(i)])
//            frameCount = Int(delays[Int(i)] / gcd)
//            
//            for _ in 0..<frameCount {
//                frames.append(frame)
//            }
//        }
//        
//        // Heyhey
//        let animation = UIImage.animatedImage(with: frames,
//            duration: Double(duration) / 1000.0)
//        
//        return animation
//    }
//    
//}



private var maxLengths = [UITextField: Int]()

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // Any text field with a set max length will call the limitLength
            // method any time it's edited (i.e. when the user adds, removes,
            // cuts, or pastes characters to/from the text field).
            addTarget(
                self,
                action: #selector(limitLength),
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    func limitLength(_ textField: UITextField) {
        if let prospectiveText = textField.text {
            // Check the textfield's length only if there's text in it.
            if prospectiveText.characters.count > maxLength {
                // If the change in the text field's contents will exceed its maximum length,
                // allow only the first [maxLength] characters of the resulting text.
                let selection = selectedTextRange
                text = prospectiveText.substring(
                    with: Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.characters.index(prospectiveText.startIndex, offsetBy: maxLength))
                )
                selectedTextRange = selection
            }
        }
    }
    
}

// This code is released under the MIT license.
// Simply put, you're free to use this in your own projects, both
// personal and commercial, as long as you include the copyright notice below.
// It would be nice if you mentioned my name somewhere in your documentation
// or credits.
//
// MIT LICENSE
// -----------
// (As defined in https://opensource.org/licenses/MIT)
//
// Copyright © 2016 Joey deVilla. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


