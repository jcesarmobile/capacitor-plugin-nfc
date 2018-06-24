import Foundation
import Capacitor
import CoreNFC

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(CapacitorNFCPlugin)
public class CapacitorNFCPlugin: CAPPlugin, NFCNDEFReaderSessionDelegate {
    
  @objc func begin(_ call: CAPPluginCall) {
    let session = NFCNDEFReaderSession(delegate: self,
                                       queue: DispatchQueue(label: "queueName", attributes: .concurrent), invalidateAfterFirstRead: false)
    session.begin()
    call.success()
  }
  
  public func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    print("invalidated")
    notifyListeners("invalidatedSession", data: [
      "message": "NFC session was invalidated"
    ])
  }
  
  public func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    for message in messages {
      for record in message.records {
        notifyListeners("tagDetected", data: [
          "payload": String(data: record.payload, encoding: .utf8)!,
          "identifier": String(data: record.identifier, encoding: .utf8)!,
          "type": String(data: record.type, encoding: .utf8)!
        ])
      }
    }
  }
}
