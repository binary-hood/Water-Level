//
//  ViewController.swift
//  Water Level
//
//  Created by Faseeh Ahmed Khan Lodhi on 1/2/23.
//

import UIKit

class WaterViewController: UIViewController {
    
    
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var limValue: UILabel!
    @IBOutlet weak var stepperConfig: UIStepper!
    
    var waterLimit: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func setWaterLimitValue(_ sender: UISlider) {
        
        let value = round(sender.value * 100) / 100.0
        let valz = String(format: "%.1f", value)
        waterLimit = Double(valz)
        limValue.text = "\(valz) (L)"
        stepperConfig.maximumValue = waterLimit ?? 3.0
    }
    
    @IBAction func trackWaterStepper(_ sender: UIStepper) {
        stepperConfig.maximumValue = waterLimit ?? 3.0
        let step = round(sender.value * 100) / 100.0
        if step <= waterLimit ?? 3.0  {
            stepperValue.text = "\(step) (L)"
        }
        
        self.waterProgress(limitSet: waterLimit ?? 3.0, waterLevel: step)
        
    }
    
    func waterProgress(limitSet: Double, waterLevel: Double){
        let probability = waterLevel/limitSet
        progressBar.progress = Float(probability)
    }
    
    
    


}

