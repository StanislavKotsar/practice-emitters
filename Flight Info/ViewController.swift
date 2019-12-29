/*
* Copyright (c) 2014-present Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import QuartzCore

class ViewController: UIViewController {
  
  @IBOutlet var bgImageView: UIImageView!
  
  @IBOutlet var summaryIcon: UIImageView!
  @IBOutlet var summary: UILabel!
  
  @IBOutlet var flightNr: UILabel!
  @IBOutlet var gateNr: UILabel!
  @IBOutlet var departingFrom: UILabel!
  @IBOutlet var arrivingTo: UILabel!
  @IBOutlet var planeImage: UIImageView!
  
  @IBOutlet var flightStatus: UILabel!
  @IBOutlet var statusBanner: UIImageView!
    
    let images: [UIImage] = []
  
  //MARK: view controller methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //adjust ui
    summary.addSubview(summaryIcon)
    summaryIcon.center.y = summary.frame.size.height/2
    
    //start rotating the flights
    changeFlightDataTo(londonToParis)
    
    let rect = CGRect(x: 0.0, y: -70.0, width: view.bounds.width, height: 50.0)
    let emitter = CAEmitterLayer()
    emitter.frame = rect
    view.layer.addSublayer(emitter)
    emitter.emitterShape = .rectangle
    
    emitter.emitterPosition = CGPoint(x: rect.width/2, y: rect.height/2)
    emitter.emitterSize = rect.size
    
    let emitterCell = CAEmitterCell()
    emitterCell.contents = UIImage(named: "flake.png")?.cgImage
    
    emitterCell.birthRate = 75
    emitterCell.lifetime = 3.5
    emitterCell.lifetimeRange = 1.0
    emitter.emitterCells = [emitterCell, configureSecondFlakeCell()]
    emitterCell.yAcceleration = 70.0
    emitterCell.xAcceleration = 10.0
    emitterCell.velocity = 20.0
    emitterCell.emissionLongitude = -.pi
    emitterCell.velocityRange = 200.0
    emitterCell.emissionRange = .pi * 0.5
    
    emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
    
    emitterCell.redRange   = 0.1
    emitterCell.greenRange = 0.1
    emitterCell.blueRange  = 0.1
    
    emitterCell.scale = 0.8
    emitterCell.scaleRange = 0.8
    emitterCell.scaleSpeed = -0.15
    
    emitterCell.alphaRange = 0.75
    emitterCell.alphaSpeed = -0.15
  }
  
    func configureSecondFlakeCell() -> CAEmitterCell {
        let secondCell = CAEmitterCell()
        secondCell.birthRate = 75
        secondCell.lifetime = 3.5
        secondCell.lifetimeRange = 1.0
        secondCell.contents = UIImage(named: "flake2.png")?.cgImage
        
        secondCell.yAcceleration = 70.0
        secondCell.xAcceleration = 10.0
        secondCell.velocity = 20.0
        secondCell.emissionLongitude = -.pi
        secondCell.velocityRange = 200.0
        secondCell.emissionRange = .pi * 0.5
        
        secondCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        
        secondCell.redRange   = 0.1
        secondCell.greenRange = 0.1
        secondCell.blueRange  = 0.1
        
        secondCell.scale = 0.8
        secondCell.scaleRange = 0.8
        secondCell.scaleSpeed = -0.15
        
        secondCell.alphaRange = 0.75
        secondCell.alphaSpeed = -0.15
        
        return secondCell
    }
    
  //MARK: custom methods
  
  func changeFlightDataTo(_ data: FlightData) {
    
    // populate the UI with the next flight's data
    summary.text = data.summary
    flightNr.text = data.flightNr
    gateNr.text = data.gateNr
    departingFrom.text = data.departingFrom
    arrivingTo.text = data.arrivingTo
    flightStatus.text = data.flightStatus
    bgImageView.image = UIImage(named: data.weatherImageName)
  }
  
  
}
