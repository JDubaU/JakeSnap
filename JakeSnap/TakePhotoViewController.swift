//
//  TakePhotoViewController.swift
//  JakeSnap
//
//  Created by Jake Wojtas on 4/26/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit
import AVFoundation



class TakePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {

    
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sendButton: UIBarButtonItem!
    @IBOutlet weak var cameraView: UIView!
    
    var captureSession = AVCaptureSession() //captureSession
    var sessionOutput = AVCapturePhotoOutput()
    var previewLayer = AVCaptureVideoPreviewLayer() //previewLayer
    
    override func viewDidLoad() {
    }
    
    @IBAction func takePhotoButton(_ sender: Any) {
        let settings = AVCapturePhotoSettings()
        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String : previewPixelType, kCVPixelBufferPixelFormatTypeKey as String : 160, kCVPixelBufferHeightKey as String : 160]
        settings.previewPhotoFormat = previewFormat
        sessionOutput.capturePhoto(with: settings, delegate: self)
        
    }
    
    @IBAction func sendButton(_ sender: Any) {
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        } //Checking for errors first
        
        if let sampleBuffer = photoSampleBuffer, let previewBuffer = photoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
            
            
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let deviceSession = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInDualCamera,.builtInTelephotoCamera,.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
        
        for device in (deviceSession?.devices)! {
            if device.position == AVCaptureDevicePosition.front {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                        
                        if captureSession.canAddOutput(sessionOutput) {
                            captureSession.addOutput(sessionOutput)
                            
                            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                            previewLayer.connection.videoOrientation = .portrait
                            
                            cameraView.layer.addSublayer(previewLayer)
                            cameraView.addSubview(takePhotoButton)
                            
                            previewLayer.position = CGPoint (x: self.cameraView.frame.width / 2, y: self.cameraView.frame.height / 2)
                            previewLayer.bounds = cameraView.frame
                            
                            captureSession.startRunning()
                        }
                    }
                } catch let AVError {
                    print(AVError)
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

}


