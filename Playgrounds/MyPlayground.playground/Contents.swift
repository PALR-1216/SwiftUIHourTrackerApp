import AVFoundation
import PlaygroundSupport
import UIKit


class CameraView:UIViewController{
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var previewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCustomCamara()
    }
    
    func showCustomCamara() {
        captureSession = AVCaptureSession()
        captureSession!.sessionPreset = .photo
        
        previewView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        view.addSubview(previewView)
        
        let cameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        guard let cameraInput = try? AVCaptureDeviceInput(device: cameraDevice!) else{return}
        
        if captureSession!.canAddInput(cameraInput) {
            captureSession!.addInput(cameraInput)
            let imageOutput = AVCaptureVideoDataOutput()
            if captureSession!.canAddOutput(imageOutput){
                captureSession!.addOutput(imageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer!.videoGravity = AVLayerVideoGravity.resize
                previewLayer!.connection?.videoOrientation = .portrait
                let viewLayer: CALayer = self.previewView.layer
                viewLayer.addSublayer(self.previewLayer!)
                captureSession!.startRunning()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer!.frame = view.frame
    }
}
PlaygroundPage.current.liveView = CameraView()
