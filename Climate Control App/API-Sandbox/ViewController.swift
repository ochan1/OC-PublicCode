//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import CoreLocation
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var outsideTemp: UILabel!
    @IBOutlet weak var insideTempTextField: UITextField!
    @IBOutlet weak var degCLabel: UILabel!
    @IBOutlet weak var insideTempPrompt: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var yourLocation: UILabel!
    @IBOutlet weak var desiredTemp: UITextField!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var lon: CLLocationDegrees = 0.0
    var lat: CLLocationDegrees = 0.0
    
    func getDataFromAPI() {
        let apiToContact = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=95dc34e8f4267a815edf2c1f2bec416b"
        print(apiToContact)
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    
                    print(json)
                    
                    var point = json["main"]["temp"].doubleValue
                    
                    point -= 272.15
                    
                    self.outsideTemp.text = String(point)
                    self.yourLocation.text = "Your Location: \(json["name"].stringValue), \(json["sys"]["country"].stringValue)"
                    //                    self.releaseDateLabel.text = ranMovie.releaseDate
                    //                    self.priceLabel.text = String(ranMovie.price)
                    //                    self.loadPoster(urlString: ranMovie.poster)
                    //                    self.movieStandby = ranMovie.link
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reloadButton(_ sender: AnyObject) {
        var iteration = 0
        if insideTempTextField.text == nil {
            self.recommendationLabel.text = "Put something in the text fields"
        }
        if desiredTemp.text == nil {
            self.recommendationLabel.text = "Put something in the text fields"
        }
        for x in insideTempTextField.text!.characters {
            if x == "." {
                iteration += 1
            }
            print(iteration)
            if iteration == 2 {
                self.recommendationLabel.text = "Bruh, dis is not a number you stupid person."
            }
        }
        for x in desiredTemp.text!.characters {
            if x == "." {
                iteration += 1
            }
            print(iteration)
            if iteration == 2 {
                self.recommendationLabel.text = "Bruh, dis is not a number you stupid person."
            }
        }
        if iteration < 2 {
            let insideTemp = Double(insideTempTextField.text!)
            print(insideTemp!)
            print(Double(self.outsideTemp.text!)!)
            if insideTemp! > Double(self.outsideTemp.text!)! {
                self.recommendationLabel.text = "Open the windows and turn on the fans. Face fans INWARDS."
            } else if insideTemp! < Double(self.outsideTemp.text!)! {
                self.recommendationLabel.text = "Leave the windows closed. You may turn on fans inside your house to circulate air."
            } else {
                self.recommendationLabel.text = "More factors are needed"
            }
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.first
        self.lat = currentLocation!.coordinate.latitude
        self.lon = currentLocation!.coordinate.longitude
        print(lat, lon)
        locationManager.stopUpdatingLocation()
        self.getDataFromAPI()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

//{"coord": {"lon":114.16,"lat":22.28},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"base":"stations","main":{"temp":300.15,"pressure":1009,"humidity":94,"temp_min":300.15,"temp_max":300.15},"visibility":10000,"wind":{"speed":4.1,"deg":170},"clouds":{"all":20},"dt":1499452200,"sys":{"type":1,"id":7904,"message":0.0034,"country":"HK","sunrise":1499377518,"sunset":1499425882},"id":8223932,"name":"Central","cod":200}

