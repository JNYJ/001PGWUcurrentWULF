//
//  ViewController.swift
//  001PGWUcurrentWULF
//
//  Created by JNYJ on 14-11-12.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

	var locationManager : CLLocationManager!
	var isLocating : Bool!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.initLocation()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	private func initLocation(){

		self.locationManager = CLLocationManager()
		self.locationManager.delegate = self
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
		self.isLocating = false;


		if JNYJ.isRunningiOS80() {
			/*
			you can set both, but just run one blow,  those items are inside in settings pages, you can shoose one
			*/
			//		[self.locationManager requestAlwaysAuthorization];// 4 ios 8 Need configure it in info.plist, keyname as "NSLocationAlwaysUsageDescription" value as ""
			self.locationManager .requestAlwaysAuthorization();// 4 ios 8 key name as  "NSLocationWhenInUseUsageDescription" value as ""
		}else{
			CLLocationManager.authorizationStatus()  // 4 ios 7/6/5/...
		}
		//
	}
	private func locateCurrentLoaction(){

		if CLLocationManager.locationServicesEnabled() {
			if let item = self.isLocating {
				if item {
					self.locationManager.stopUpdatingLocation()
				}else{
					self.locationManager.startUpdatingLocation()
				}
			}
		}else{
			if JNYJ.isRunningiOS80() {
				let alert = UIAlertView()
				alert.title = "Noop"
				alert.message = "Need to enable location service."
				alert.addButtonWithTitle("OK")
				alert.show()
			}else{
				var alert : UIAlertController = UIAlertController(
					title: "Noop",
					message: "Need to enable location service.",
					preferredStyle: UIAlertControllerStyle.Alert)
				alert.addAction(UIAlertAction(title: "OK", style:.Default, handler: nil))
				self.presentViewController(alert, animated: true, completion: nil)
			}
		}

	}
	//MARK:  Location delegate
	func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
		if let item = locations {
			if item.count>0 {
				println("Located..."+"\(item)")
				self.isLocating =  true
				self.locationManager.stopUpdatingLocation()
			}
		}
	}
	//MARK:  IBActions
	@IBAction func event_locate(){
		self.locateCurrentLoaction()
	}
}

