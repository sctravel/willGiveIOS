//
//  ViewController.swift
//  NavigationAndTabView
//
//  Created by Cyrus Zhang on 1/31/15.
//  Copyright (c) 2015 Cyrus Zhang. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var detailPageButton: UIButton!
    
    
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var charity:NSDictionary?
    
    var qrStringOld : String?
    
    // Added to support different barcodes
    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showQRscanWindow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if(segue.identifier != nil && segue.identifier! == "scanToDetailPage") {
            var detailView : DetailPageViewController = segue.destinationViewController as! DetailPageViewController
            NSLog("prepareForSegue for detail page")
            detailView.charity = self.charity
        }
        
    }

    func showQRscanWindow() {
        var logger = getLogger()
        logger.log("showing QR scan window...")
        
        // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
        // as the media type parameter.
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        // Get an instance of the AVCaptureDeviceInput class using the previous device object.
        var error:NSError?
        let input: AnyObject! = AVCaptureDeviceInput.deviceInputWithDevice(captureDevice, error: &error)
        
        if (error != nil) {
            // If any error occurs, simply log the description of it and don't continue any more.
            println("\(error?.localizedDescription)")
            return
        }
        
        // Initialize the captureSession object.
        captureSession = AVCaptureSession()
        // Set the input device on the capture session.
        captureSession?.addInput(input as! AVCaptureInput)
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        
        // Set delegate and use the default dispatch queue to execute the call back
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        captureMetadataOutput.metadataObjectTypes = supportedBarCodes
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        innerView.layer.addSublayer(videoPreviewLayer)
        
        // Start video capture.
        captureSession?.startRunning()
        
        // Move the message label to the top view
        detailPageButton.enabled = false
        innerView.bringSubviewToFront(detailPageButton)
        
        
        NSLog("initialize GreenBox...")
        
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView?.layer.borderWidth = 2
        innerView.addSubview(qrCodeFrameView!)
        innerView.bringSubviewToFront(qrCodeFrameView!)

    }

    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRectZero
            detailPageButton.setTitle("No QR code is detected", forState: UIControlState.Normal)
            detailPageButton.backgroundColor = UIColor.grayColor();
            detailPageButton.enabled = false
            qrStringOld = nil
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            qrCodeFrameView?.frame = barCodeObject.bounds;
            
            if metadataObj.stringValue != nil && metadataObj.stringValue != qrStringOld {
                
                qrStringOld = metadataObj.stringValue
                
                self.charity = parseQrCodeString(metadataObj.stringValue)
                NSLog("parsed charity: \(self.charity)")
                
                if self.charity != nil {
                    var name = self.charity!["name"] as! String
                    detailPageButton.setTitle("Go to \(name)", forState: UIControlState.Normal)
                    
                    detailPageButton.backgroundColor = UIColor.greenColor();
                    detailPageButton.enabled = true
                }
                else {
                    detailPageButton.setTitle("invalid QR code", forState: UIControlState.Normal)
                }

            }
            else if metadataObj.stringValue != nil && metadataObj.stringValue == qrStringOld {
                
            }
            else {
                NSLog("no qr string is detected anymore... resetting qrStringOld")
                qrStringOld = nil
            }
        }
        
    }

    func parseQrCodeString(input : String) -> NSDictionary?
    {
        NSLog(input)
        
        var pattern = "^" + QrPrefix + "([0-9]+)\\?r=(.*)&n=(.*)&a=(.*)&p=.(.*)&m=(.*)$"
        var regex = NSRegularExpression(pattern: pattern, options: nil, error: nil)
        var result = regex?.firstMatchInString(input, options: nil, range : NSMakeRange(0,count(input)))
        
        if(result?.rangeAtIndex(1) != nil
            && result?.rangeAtIndex(2) != nil
            && result?.rangeAtIndex(3) != nil
            && result?.rangeAtIndex(4) != nil
            && result?.rangeAtIndex(5) != nil
            && result?.rangeAtIndex(6) != nil
            ) {
            
            var ein = (input as NSString).substringWithRange(result!.rangeAtIndex(1))
            var recipientId = (input as NSString).substringWithRange(result!.rangeAtIndex(2))
            var name = (input as NSString).substringWithRange(result!.rangeAtIndex(3))
            var address = (input as NSString).substringWithRange(result!.rangeAtIndex(4))
            var phone = (input as NSString).substringWithRange(result!.rangeAtIndex(5))
            var mission = (input as NSString).substringWithRange(result!.rangeAtIndex(6))
                
            // process name, address, mission
            let newname = name.replaceCharacterInString("^", replace: " ")
            let newaddress = address.replaceCharacterInString("^", replace : " ")
            let newmission = mission.replaceCharacterInString("^", replace: " ")
            
            // NSDictionary does not like optional values; it will complain about "cannot convert to type StringLiteralConvertible"
            var ret = [
                "ein" : ein,
                "recipientId" : recipientId.toInt()!,
                "name" : newname,
                "address" : newaddress,
                "phone" : phone,
                "mission" : newmission,
                "offline" : true
            ]
        
            return NSDictionary(dictionary: ret)
        }
        return nil
    }
    
}

