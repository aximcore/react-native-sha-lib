import CryptoKit
import CommonCrypto

@available(iOS 13.0, *)
extension Digest {
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }

    var hexStr: String {
        bytes.map { String(format: "%02X", $0).lowercased() }.joined()
    }
}

@objc(Sha1Lib)
class Sha1Lib: NSObject {
    
    @objc(sha1:withResolver:withRejecter:)
    func sha1(input: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        let data = Data(input.utf8)
        
        if #available(iOS 13, *) {
            resolve(self.sha1_iOS13(input: data).hexStr)
        } else {
            resolve(self.sha1_legacy(input: data))
        }
    }
    
    @available(iOS 13.0, *)
    func sha1_iOS13(input: Data) -> Insecure.SHA1Digest {
        return Insecure.SHA1.hash(data: input)
    }
    
    func sha1_legacy(input: Data) -> String {
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        input.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(input.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
        // return "NOT SUPPORTED"
    }
}
